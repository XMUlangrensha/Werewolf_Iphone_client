//
//  Gameresult.m
//  Werewolf
//
//  Created by mac on 13-11-11.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Gameresult.h"

@interface Gameresult ()
@end

@implementation Gameresult
@synthesize gameResult;
@synthesize event;
@synthesize gameEnd;
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
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.ClientSocket.delegate = self;
    gameResult = myDelegate.gameResult;
    event = myDelegate.event;
    
    if (gameResult == [event WOLF_WIN]) {
        gameEnd.text = @"狼人赢了";
    }else if (gameResult == [event VILLAGER_WIN]){
         gameEnd.text = @"村民赢了";
    }else if (gameResult == [event LOVER_WIN]){
        gameEnd.text = @"情侣赢了";
    }else if (gameResult == [event EQUAL]){
        gameEnd.text = @"平局";
    }
}
-(void)getDataFromServer:(NSData *)data
{
    
}

@end
