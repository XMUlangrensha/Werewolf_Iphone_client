//
//  Wolfviewcontroller.h
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
@interface Wolfviewcontroller : UIViewController<clientsocketprotocol,UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextView *InfoBox;
@property (weak, nonatomic) IBOutlet UIPickerView *VotePicker;
@property (weak, nonatomic) IBOutlet UIButton *voteButton;
@property (weak, nonatomic) IBOutlet UIButton *speechOverButton;
@property (weak, nonatomic) IBOutlet UIButton *kiilButton;

@property Event *event;
@property NSMutableArray *allPlayer;
@property int gameend;

@property AVAudioPlayer *soundPlayer;

- (IBAction)VoteButton:(id)sender;
- (IBAction)SpeechOverButton:(id)sender;
- (IBAction)WolfKillButon:(id)sender;

-(void)getDataFromServer:(NSData *)data;

@end
