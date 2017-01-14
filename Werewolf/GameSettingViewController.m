//
//  GameSettingViewController.m
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "GameSettingViewController.h"

@interface GameSettingViewController ()

@end

@implementation GameSettingViewController
@synthesize txtPlayerName;
@synthesize nameStr;
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
    
    nameStr = @"";
    [txtPlayerName setText:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSubmit:(id)sender {
    nameStr = txtPlayerName.text;
    if ((![nameStr isEqualToString:@""]) && nameStr != nil) {
        [self performSegueWithIdentifier:@"gamesettingToIndex" sender:self];
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"玩家名字不能为空！" delegate:nil cancelButtonTitle:@"知道了～" otherButtonTitles:nil];
        
        [alert show];
    }
    

}

- (IBAction)txtEndEdit:(id)sender {
    
     [sender resignFirstResponder];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"gamesettingToIndex"])
    {
        IndexViewController *indexCon = segue.destinationViewController;
        
        indexCon.player = [[Player alloc] init];
        indexCon.player.name = nameStr;
        NSLog(@"%@",indexCon.player.name);
        
    }
    
}

@end
