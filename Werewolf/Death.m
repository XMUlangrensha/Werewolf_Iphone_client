//
//  Death.m
//  Werewolf
//
//  Created by mac on 13-11-8.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Death.h"

@interface Death ()

@end

@implementation Death
@synthesize event;
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
     NSLog(@"再viewfidload里的segua");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDataFromServer:(NSData *)data{
    
    NSArray * parsedArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:Nil];
    int recieveEvent = [[parsedArray objectAtIndex:0] intValue];
    
    if(recieveEvent == [event SERVER_GAME_RESULT])
    {
        [AppDelegate app].gameResult = [[parsedArray objectAtIndex:1] integerValue];
        NSLog(@"再getdata里的segua");
        [self performSegueWithIdentifier:@"toGameResult" sender:self];
    }
}
- (IBAction)finalSpeechOver:(id)sender {
    NSArray * speechover = [NSArray arrayWithObjects:[NSNumber numberWithInt:[event CLIENT_SPEECH_OVER]], nil];
    [[AppDelegate app].ClientSocket sendArray:speechover];
}
@end
