//
//  GameSettingViewController.h
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexViewController.h"
@interface GameSettingViewController : UIViewController



@property NSString *nameStr;
@property (weak, nonatomic) IBOutlet UITextField *txtPlayerName;
- (IBAction)btnSubmit:(id)sender;
- (IBAction)txtEndEdit:(id)sender;

@end
