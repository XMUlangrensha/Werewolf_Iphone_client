//
//  ShowRoleViewController.m
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "ShowRoleViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ShowRoleViewController ()

@end

@implementation ShowRoleViewController

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
    
    //IDCardViewController *primaryView = [[IDCardViewController alloc] initWithNibName:@"IDCardView" bundle:nil];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showRoleToWaiting"])
    {
        WaitingViewController *waitingCon = segue.destinationViewController;
        
        waitingCon.mySocket = mySocket;
        
    }
    
}

@end
