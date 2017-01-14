//
//  WolfRoleCard.m
//  Werewolf
//
//  Created by liwei on 13-11-9.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "WolfRoleCard.h"

@interface WolfRoleCard ()

@end

@implementation WolfRoleCard
@synthesize event;
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
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.ClientSocket.delegate = self;
    
    UIImageView *profileViewFront = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"背面2.jpg"]];
    UIImageView *profileViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"狼人2.jpg"]];
    
    [coinView setPrimaryView: profileViewFront];
    [coinView setSecondaryView: profileViewBack];
    [coinView setSpinTime:1.0];
    
}


-(void)getDataFromServer:(NSData *)data
{
}


@end
