//
//  ShowMyRoleViewController.m
//  Werewolf
//
//  Created by mac on 13-11-4.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "ShowMyRoleViewController.h"


@interface ShowMyRoleViewController ()

@end

@implementation ShowMyRoleViewController
@synthesize coinView;
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
    
    UIImageView *profileViewFront = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"profile.png"]];
    UIImageView *profileViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"profile.png"]];
    
    [coinView setPrimaryView: profileViewBack];
    [coinView setSecondaryView: profileViewFront];
    [coinView setSpinTime:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
