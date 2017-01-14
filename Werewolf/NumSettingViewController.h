//
//  NumSettingViewController.h
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "ShowRoleViewController.h"
@interface NumSettingViewController : UIViewController


@property int numberOfPlayer;

@property SocketComunication *mySocket;

@property (weak, nonatomic) IBOutlet UITextField *numTxt;

- (IBAction)changeNum:(id)sender;
- (IBAction)txtNumEndEdit:(id)sender;

@end
