//
//  NumSettingViewController.m
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "NumSettingViewController.h"

@interface NumSettingViewController ()

@end

@implementation NumSettingViewController

@synthesize numTxt;
@synthesize mySocket;
@synthesize  numberOfPlayer;

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
    
   [numTxt setText:@"6"];
    numberOfPlayer = 6;
    [self.numTxt setFont : [UIFont fontWithName:@"方正古隶简体" size:13.0f]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"numSettingToShowRole"])
    {
        ShowRoleViewController *showRoleCon = segue.destinationViewController;
        
        showRoleCon.mySocket = mySocket;
        
    }
   
    
}
- (IBAction)changeNum:(id)sender {
    
    NSString *numStr = [numTxt text];
    int number = [numStr intValue];
    if ([sender tag]==1) {
        if (number < 16) {
            number++;
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该游戏玩家人数设定在6～16范围内" delegate:nil cancelButtonTitle:@"知道了～" otherButtonTitles:nil];
            
            [alert show];
        }
    }
    else if ([sender tag] == 0){
        if (number > 6) {
            number--;
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该游戏玩家人数设定在6～16范围内" delegate:nil cancelButtonTitle:@"知道了～" otherButtonTitles:nil];
            
            [alert show];
        }
    }
    numStr = [NSString stringWithFormat:@"%d",number];
    [numTxt setText:numStr];
    numberOfPlayer = [numTxt.text intValue];
}

- (IBAction)txtNumEndEdit:(id)sender{
    [sender resignFirstResponder];
    numberOfPlayer = [numTxt.text intValue];

}
@end
