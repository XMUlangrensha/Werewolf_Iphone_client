//
//  ChooseRoleViewController.m
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "ChooseRoleViewController.h"

@interface ChooseRoleViewController ()

@end

@implementation ChooseRoleViewController
@synthesize  mySocket;

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

-(void)process{
    
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"chooseRoleToNumSetting"])
    {
        NumSettingViewController *numSettingCon = segue.destinationViewController;
        
        numSettingCon.mySocket = mySocket;

    }
    if([segue.identifier isEqualToString:@" chooseRoleToValidate"])
    {
        ValidateViewController *validateCon = segue.destinationViewController;
        
       validateCon.mySocket = mySocket;
        
    }
   
}

@end
