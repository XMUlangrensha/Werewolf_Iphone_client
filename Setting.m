//
//  Setting.m
//  Werewolf
//
//  Created by mac on 13-11-11.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Setting.h"
#import "AppDelegate.h"
@interface Setting ()

@end

@implementation Setting
@synthesize nameBox;
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

- (IBAction)hideKeyBoard:(id)sender {
    [AppDelegate app].player.name = nameBox.text;
    [sender resignFirstResponder];
}
@end
