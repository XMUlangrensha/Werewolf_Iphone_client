//
//  Choosefang.m
//  Werewolf
//
//  Created by mac on 13-11-6.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Choosefang.h"

@interface Choosefang ()

@end

@implementation Choosefang
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choosefangzu:(id)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    [myDelegate.ClientSocket ConnectToSever];
    
    NSNumber* eventType = [NSNumber numberWithInt:0];
    NSString* otherInfo = @"6";
    myDelegate.player.isOwner = [NSNumber numberWithBool:true];
    NSString* numName = [myDelegate.player.name stringByAppendingString:[NSString stringWithFormat:@":%@",myDelegate.player.playerId]];
      NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          myDelegate.player.playerId,@"id",
                          numName,@"name",
                          myDelegate.player.isOwner,@"isOwner",nil];
    
    NSArray *array = [NSArray arrayWithObjects:eventType,info,otherInfo, nil];
    [myDelegate.ClientSocket sendArray:array];
}

- (IBAction)choosefangke:(id)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    [myDelegate.ClientSocket ConnectToSever];
    
    
    NSNumber* eventType = [NSNumber numberWithInt:0];
    NSString* otherInfo = @"999";
    myDelegate.player.isOwner = [NSNumber numberWithBool:false];
    NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          myDelegate.player.playerId,@"id",
                          myDelegate.player.name,@"name",
                          myDelegate.player.isOwner,@"isOwner",nil];
    
    NSArray *array = [NSArray arrayWithObjects:eventType,info,otherInfo, nil];
    [myDelegate.ClientSocket sendArray:array];
}
@end
