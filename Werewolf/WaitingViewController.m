//
//  WaitingViewController.m
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "WaitingViewController.h"

@interface WaitingViewController ()

@end

@implementation WaitingViewController

@synthesize mySocket;

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
/*
-(void)viewDidlAppear:(BOOL)animated{
    [self performSelector:@selector(delayMethod:) withObject:nil afterDelay: 0.5 ];

}

*/

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    //根据消息判断跳转进入游戏界面
    if (YES) {
     [self performSegueWithIdentifier:@"waitingToShowMyRole" sender:self];
    }
}


@end
