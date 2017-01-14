//
//  WitchViewController.h
//  Werewolf
//
//  Created by mac on 13-11-9.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "Event.h"
#import "AppDelegate.h"
#import <AVFoundation/AVAudioPlayer.h>
@interface WitchViewController : UIViewController<clientsocketprotocol,UIPickerViewDelegate, UIPickerViewDataSource>
@property Event *event;
@property (weak, nonatomic) IBOutlet UITextView *InfoBox;
@property (weak, nonatomic) IBOutlet UIPickerView *VotePicker;
@property (weak, nonatomic) IBOutlet UIButton *voteButton;
@property (weak, nonatomic) IBOutlet UIButton *speechOverButton;
@property (weak, nonatomic) IBOutlet UIButton *PosionRealButton;
@property NSMutableArray *allPlayer;
@property NSNumber* toSaveID;
@property BOOL hasOne;
@property AVAudioPlayer *soundPlayer;
- (IBAction)PoisonButton:(id)sender;
- (IBAction)VoteButton:(id)sender;
- (IBAction)SpeechOverButton:(id)sender;
-(void)getDataFromServer:(NSData *)data;

@end
