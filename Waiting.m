//
//  Waiting.m
//  Werewolf
//
//  Created by mac on 13-11-6.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Waiting.h"

@interface Waiting ()

@end

@implementation Waiting
@synthesize showNum;
@synthesize showRoomNum;
@synthesize event;
@synthesize infoBox;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataFromServer:(NSData *)data
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    NSArray * parsedArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:Nil];
    int recieveEvent = [[parsedArray objectAtIndex:0] intValue];

    if (recieveEvent == [event SERVER_ROOM])
    {
        int myRoom = [[parsedArray objectAtIndex:1] intValue];
        int myID = [[parsedArray objectAtIndex:2] intValue];
        myDelegate.player.playerId  = [NSNumber numberWithInt:myID];
        NSString *addInfo = [NSString stringWithFormat:@"房间号是：%d,你是玩家%d\n",myRoom,myID];
        showRoomNum.text=addInfo;
    
    }else if(recieveEvent == [event SERVER_JOINED_COUNT])
    {
        int joinedCount = [[parsedArray objectAtIndex:1] intValue];
        int maxPlayerCount = [[parsedArray objectAtIndex:2] intValue];
        myDelegate.allPlayNameArr = [parsedArray objectAtIndex:3];
        NSString* alreadyPlayerNames = @"";
        BOOL isMy = [myDelegate.player.playerId isEqualToNumber:[NSNumber numberWithInt:joinedCount]];
        if (isMy) {
          
            for (int i=0; i<[myDelegate.allPlayNameArr count]-1;i++){
                alreadyPlayerNames = [alreadyPlayerNames stringByAppendingString:@"玩家："];
                alreadyPlayerNames =  [alreadyPlayerNames stringByAppendingString:[myDelegate.allPlayNameArr objectAtIndex:i]];
                alreadyPlayerNames = [alreadyPlayerNames stringByAppendingString:@"已加入游戏\n"];
            }
            
                alreadyPlayerNames = [alreadyPlayerNames stringByAppendingString:@"你加入游戏。\n"];
        }
        
        
        
        
        if ([myDelegate.player.playerId intValue] < joinedCount) {
          alreadyPlayerNames =  [alreadyPlayerNames stringByAppendingString:[NSString stringWithFormat:@"玩家%@加入游戏\n",[myDelegate.allPlayNameArr lastObject]]];
        }
        
        NSString *addInfo = [NSString stringWithFormat:@"已加入玩家人数（%d/%d）\n",joinedCount,maxPlayerCount];
        showNum.text= addInfo;
        infoBox.text = [infoBox.text stringByAppendingString:alreadyPlayerNames];
        
    
    }else if(recieveEvent == [event SERVER_ROLE_INFO])
    {
        NSString* mystr  = [parsedArray objectAtIndex:1];
        NSDictionary* dic = (NSDictionary *)mystr;
        myDelegate.player.roleId = [[dic objectForKey:@"id"] intValue];
        if (myDelegate.player.roleId == 5) {
            [self performSegueWithIdentifier:@"ToVillage" sender:self];
        }
        if (myDelegate.player.roleId == 1) {
            [self performSegueWithIdentifier:@"ToCupid" sender:self];
        }
        if (myDelegate.player.roleId == 7) {
            [self performSegueWithIdentifier:@"ToWolf" sender:self];
        }
        if (myDelegate.player.roleId == 6) {
            [self performSegueWithIdentifier:@"ToWitch" sender:self];
        }
        
        
    }
    
    

}
@end
