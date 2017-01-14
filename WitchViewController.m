//
//  WitchViewController.m
//  Werewolf
//
//  Created by mac on 13-11-9.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "WitchViewController.h"

@interface WitchViewController ()

@end

@implementation WitchViewController
@synthesize InfoBox;
@synthesize VotePicker;
@synthesize event;
@synthesize allPlayer;
@synthesize hasOne;
@synthesize voteButton;
@synthesize speechOverButton;
@synthesize PosionRealButton;
@synthesize toSaveID;

@synthesize soundPlayer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.ClientSocket.delegate = self;
    event = myDelegate.event;
    allPlayer =  [NSMutableArray arrayWithArray:myDelegate.allPlayNameArr];
    hasOne = false;
 //   voteButton.hidden = true;
 //   speechOverButton.hidden = true;
    
    
    
}


- (IBAction)PoisonButton:(id)sender {
    NSInteger row = [VotePicker selectedRowInComponent:0];
    NSString *selected = [allPlayer objectAtIndex:row];
    NSNumber* toPoisonID = [AppDelegate getIdByName:selected];
    NSArray * PoisionArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_WITCHPOISON_ACTION]],toPoisonID, nil];
    [[AppDelegate app].ClientSocket sendArray:PoisionArr];
     PosionRealButton.hidden = true;
}

- (IBAction)VoteButton:(id)sender {
    NSInteger row = [VotePicker selectedRowInComponent:0];
    NSString *selected = [allPlayer objectAtIndex:row];
    NSNumber* getVoteId = [AppDelegate getIdByName:selected];
    
    NSArray * voteArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_VOTE_ACTION]],getVoteId, nil];
    [[AppDelegate app].ClientSocket sendArray:voteArr];
}
- (IBAction)SpeechOverButton:(id)sender {
    NSArray * speechover = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_SPEECH_OVER]], nil];
    [[AppDelegate app].ClientSocket sendArray:speechover];
}

-(void)getDataFromServer:(NSData *)data
{
     AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSArray* tempAllName = [NSArray arrayWithArray:[AppDelegate app].allPlayNameArr];
    
    NSArray * parsedArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:Nil];
    for( NSString* str in parsedArray){
        NSLog(@"%@",str);
    }
    int recieveEvent = [[parsedArray objectAtIndex:0] intValue];
    
    if (recieveEvent == [event SERVER_NIGHT_DEATH])
    {
        NSArray* deads = [parsedArray objectAtIndex:1];
        int dead_count = 0;
        InfoBox.text = [InfoBox.text stringByAppendingString:@"昨天死亡的人："];
        for (int i = 1; i < [deads count]; i++) {
            if ([[deads objectAtIndex:i] intValue] == 2) {
                [allPlayer removeObject:[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                NSString *addInfo = [NSString stringWithFormat:@"玩家%@被狼人杀死\n",[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                InfoBox.text = [InfoBox.text stringByAppendingString:addInfo];
                dead_count++;
            } else if ([[deads objectAtIndex:i] intValue] == 3) {
                [allPlayer removeObject:[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                NSString *addInfo = [NSString stringWithFormat:@"玩家%@被女巫毒死\n",[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                InfoBox.text = [InfoBox.text stringByAppendingString:addInfo];
                dead_count++;
            } else if ([[deads objectAtIndex:i] intValue] == 4) {
                [allPlayer removeObject:[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                NSString *addInfo = [NSString stringWithFormat:@"玩家%@殉情而死\n",[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]];
                InfoBox.text = [InfoBox.text stringByAppendingString:addInfo];
                dead_count++;
            }
            [VotePicker reloadAllComponents];
        }
        if (dead_count == 0)
            InfoBox.text = [InfoBox.text stringByAppendingString:@"昨晚是个平安夜，没人死亡。\n"];
        
        
    }else if(recieveEvent == [event SERVER_YOU_ARE_DEAD])
    {
        InfoBox.text = [InfoBox.text stringByAppendingString:@"YOU ARE DEAD"];
   //     if (hasOne == false)
         NSLog(@"再witch  to death里的segua");
        [self performSegueWithIdentifier:@"ToDeath" sender:self];
        hasOne = true;
        
    }else if(recieveEvent == [event SERVER_CLOSE_EYES])
    {
        int day = [[parsedArray objectAtIndex:1] intValue];
        NSString* addStr = [NSString stringWithFormat:@"天黑请闭眼，今天是第%d天\n",day];
        InfoBox.text = [InfoBox.text stringByAppendingString:addStr];
        
        NSURL *audioURL_NightComing=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tianhei" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_NightComing error:nil];
        [soundPlayer play];
    }
    else if(recieveEvent == [event SERVER_OPEN_EYES])
    {
        int day = [[parsedArray objectAtIndex:1] intValue];
        NSString* addStr = [NSString stringWithFormat:@"天亮请睁眼，今天是第%d天\n",day];
        InfoBox.text = [InfoBox.text stringByAppendingString:addStr];
        NSURL *audioURL_DayComing=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tianliang" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_DayComing error:nil];
        [soundPlayer play];

    }
    else if(recieveEvent == [event SERVER_VOTE_START])
    {
        InfoBox.text = [InfoBox.text stringByAppendingString:@"开始投票:\n"];
        
        NSURL *audioURL_Vote=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"toupiao" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_Vote error:nil];
        [soundPlayer play];
        
        NSArray* toVoteIds = [parsedArray objectAtIndex:1];
        NSString* addStr = @"候选人有：\n";
        for (int i = 1; i < [toVoteIds count]; i++)
            if ([[toVoteIds objectAtIndex:i] boolValue] == true)
                addStr = [addStr stringByAppendingString:[NSString stringWithFormat:@"%@, ",[[AppDelegate app].allPlayNameArr objectAtIndex:i-1]]];
        InfoBox.text = [InfoBox.text stringByAppendingString:@"\n"];
        InfoBox.text = [InfoBox.text stringByAppendingString:addStr];
    }
    else if(recieveEvent == [event SERVER_SPEECH_START])
    {
        
        int speechId = [[parsedArray objectAtIndex:1] integerValue];
        NSString* speechName = [tempAllName objectAtIndex:speechId-1];
        InfoBox.text = [InfoBox.text stringByAppendingString:[NSString stringWithFormat:@"玩家%d.%@正在发言。。。\n",speechId,speechName]];
        
        NSURL *audioURL_Speech=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:[[NSString alloc]initWithFormat:@"%d",speechId] ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_Speech error:nil];
        [soundPlayer play];
        
        // 如果轮到自己发言，则计时
        if ([[AppDelegate app].player.playerId isEqualToNumber:[NSNumber numberWithInt:speechId]]) {
            InfoBox.text = [InfoBox.text stringByAppendingString:@"轮到你发言了。\n"];
        }
    }else if(recieveEvent == [event SERVER_VILLAGER_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"村民们不会坐以待毙，找到这些狼人并处决他们！\n"];
    }
    else if(recieveEvent == [event SERVER_EXECUTE_ID]){
        NSArray* executeIds = [parsedArray objectAtIndex:1];
        if ([[executeIds objectAtIndex:0] intValue] == 0)
            InfoBox.text = [InfoBox.text stringByAppendingString:@"平票已达三次，没有处死任何人\n"];
        else {
            int dead = [[executeIds objectAtIndex:0] intValue] ;
            NSString *deadName = [tempAllName objectAtIndex:dead-1];
            NSString* add= [NSString stringWithFormat:@"村民们投票，处死了玩家%@\n",deadName];
            InfoBox.text = [InfoBox.text stringByAppendingString:add];
            if ([executeIds count] > 1) {
                int deads = [[executeIds objectAtIndex:1] intValue];
                NSString* deadName1 = [tempAllName objectAtIndex:deads-1];
                NSString* add1= [NSString stringWithFormat:@"玩家%@殉情\n",deadName1];
                InfoBox.text = [InfoBox.text stringByAppendingString:add1];
            }
        }
    }
    else if(recieveEvent == [event SERVER_GAME_RESULT])
    {
    
        [AppDelegate app].gameResult = [[parsedArray objectAtIndex:1] integerValue];
    //    if (hasOne  ==  false)
         NSLog(@"再getdata   togameresult里的segua");
        [self performSegueWithIdentifier:@"toGameResult" sender:self];
     
        hasOne = true;
        
    }
    else if(recieveEvent == [event SERVER_WOLF_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"狼人请睁眼，狼人请杀人！\n"];
        NSURL *audioURL_WolfOpenEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"狼人请睁眼" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WolfOpenEye error:nil];
        [soundPlayer play];
        
        if ([AppDelegate app].player.roleId == 7) {
            InfoBox.text = [InfoBox.text stringByAppendingString:@"请选择任意一位玩家！】\n"];
        }
        
    }
    else if(recieveEvent == [event SERVER_CUPID_START])
    {
        InfoBox.text = [InfoBox.text stringByAppendingString:@"丘比特请连接情侣，请选择两个玩家\n"];
        NSURL *audioURL_CupidOpenEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"丘比特请睁眼" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_CupidOpenEye error:nil];
        [soundPlayer play];
        
        NSURL *audioURL_CupidOperation=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"丘比特请连情侣" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_CupidOperation error:nil];
        [soundPlayer play];
    }
    else if (recieveEvent == [event SERVER_CUPID_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"丘比特请睁眼，丘比特请连情侣。\n"];
        if ([AppDelegate app].player.roleId == 1) {
            InfoBox.text = [InfoBox.text stringByAppendingString:@"【请选择任意两位玩家！】\n"];
    }
    }
    else if(recieveEvent == [event SERVER_CUPID_OVER])
    {
        InfoBox.text = [InfoBox.text stringByAppendingString:@"丘比特请闭眼"];
        NSURL *audioURL_CupidCloseEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"丘比特请闭眼" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_CupidCloseEye error:nil];
        [soundPlayer play];
        
        
        int firstID = [[parsedArray objectAtIndex:1] intValue];
        int secondID = [[parsedArray objectAtIndex:2]intValue];
        if (firstID > 0 && secondID > 0) {
            
            NSString* boy = [tempAllName objectAtIndex:firstID-1];
            NSString* girl = [tempAllName objectAtIndex:secondID-1];
            
            if ([AppDelegate app].player.roleId == 1) {
                NSString* add = [NSString stringWithFormat:@"已连接情侣%@和%@\n",boy,girl];
                InfoBox.text = [InfoBox.text stringByAppendingString:add];
                
            }
            if ([myDelegate.player.playerId isEqualToNumber:[NSNumber numberWithInt:firstID]] || [myDelegate.player.playerId isEqualToNumber:[NSNumber numberWithInt:secondID]])
            {
                NSString* add = [NSString stringWithFormat:@"%@和%@成为情侣。\n",boy,girl];
                InfoBox.text = [InfoBox.text stringByAppendingString:add];
                
            }
        }else{
            if ([AppDelegate app].player.roleId == 1) {
                InfoBox.text = [InfoBox.text stringByAppendingString:@"丘比特没有连接情侣\n"];
                
            }
            
        }
    } else if(recieveEvent == [event SERVER_WOLF_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"狼人请睁眼，狼人请杀人！\n"];
        NSURL *audioURL_WolfKill=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"狼人请杀人" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WolfKill error:nil];
        [soundPlayer play];
    }
    else if(recieveEvent == [event SERVER_WOLF_OVER]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"狼人请闭眼.\n"];
        NSURL *audioURL_WolfCloseEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"狼人请闭眼" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WolfCloseEye error:nil];
    }
    else if (recieveEvent == [event SERVER_WITCHSAVE_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"女巫请睁眼，女巫请救人！\n"];
        NSURL *audioURL_WitchOpenEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"女巫请睁眼" ofType:@"mp3"]];
        NSURL *audioURL_WitchSaveHim=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"今晚死的人是他，你要救他吗" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WitchOpenEye error:nil];
        [soundPlayer play];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WitchSaveHim error:nil];
        [soundPlayer play];
        

        if ([AppDelegate app].player.roleId == 6) {
            int toKillId = [[parsedArray objectAtIndex:1] intValue];
            toSaveID = [NSNumber numberWithInt:toKillId];
            NSString* saveName = [tempAllName objectAtIndex:toKillId-1];
            NSString* str = [NSString stringWithFormat:@"【今晚被杀的人是玩家%@,请问你救或不救？】\n",saveName];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"不救" otherButtonTitles:@"救", nil];
            [alert setTag:1];
            [alert show];
        }
    }else if(recieveEvent == [event SERVER_VILLAGER_START]){
        InfoBox.text = [InfoBox.text stringByAppendingString:@"村民们不会坐以待毙，找到这些狼人并处决他们！\n"];
    }
    else if(recieveEvent == [event SERVER_WITCHPOISON_START]){
    if ([AppDelegate app].player.roleId == 6) {
        InfoBox.text = [InfoBox.text stringByAppendingString:@"【毒是不毒？】\n"];
        NSString* str = @"女巫要不要毒人?\n";
        UIAlertView *alertPoision = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"不毒" otherButtonTitles:@"毒", nil];
        [alertPoision setTag:2];
        [alertPoision show];
        }
    }else if(recieveEvent  == [event SERVER_WITCHSAVE_OVER]){
    if ([AppDelegate app].player.roleId == 6) {
        int playerId = [[parsedArray objectAtIndex:1] intValue];
        if (playerId == 0) {
            InfoBox.text = [InfoBox.text stringByAppendingString:@"女巫救人失败，解药已用完\n"];
        } else {
              NSString* savedPerson = [tempAllName objectAtIndex:playerId-1];
            NSString* str = [NSString stringWithFormat:@"女巫救人成功，玩家%@被解救】\n",savedPerson];
          InfoBox.text = [InfoBox.text stringByAppendingString:str];
        }
    }
    }
    else if (recieveEvent == [event SERVER_WITCHPOISON_OVER]){
    if ([AppDelegate app].player.roleId == 6) {
        int playerId = [[parsedArray objectAtIndex:1] intValue];
        if (playerId == 0) {
            InfoBox.text = [InfoBox.text stringByAppendingString:@"女巫毒人失败，毒药已用完\n"];
        } else {
            NSString* savedPerson = [tempAllName objectAtIndex:playerId-1];
            NSString* str = [NSString stringWithFormat:@"女巫毒人成功，玩家%@被毒死】\n",savedPerson];
            InfoBox.text = [InfoBox.text stringByAppendingString:str];
        }
    }
     InfoBox.text = [InfoBox.text stringByAppendingString:@"女巫请闭眼！\n"];
        NSURL *audioURL_WitchCloseEye=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"女巫请闭眼" ofType:@"mp3"]];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL_WitchCloseEye error:nil];
    }
    [InfoBox scrollRangeToVisible:NSMakeRange([InfoBox.text length], 0)];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [allPlayer count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [allPlayer objectAtIndex:row];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 1){
    if (buttonIndex == 1) {
        NSArray * PoisionArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_WITCHSAVE_ACTION]],toSaveID, nil];
        [[AppDelegate app].ClientSocket sendArray:PoisionArr];
    }else if(buttonIndex == 0){
        NSArray * PoisionArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_WITCHSAVE_ACTION]],[NSNumber numberWithInt:0], nil];
        [[AppDelegate app].ClientSocket sendArray:PoisionArr];
    }}
    if(alertView.tag == 2 ){
    if(buttonIndex == 0){
            NSArray * PoisionArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_WITCHPOISON_ACTION]],[NSNumber numberWithInt:0], nil];
            [[AppDelegate app].ClientSocket sendArray:PoisionArr];
        PosionRealButton.hidden = true;
        }
    else if(buttonIndex == 1){
        PosionRealButton.hidden = false;
    }
    }
}

@end
