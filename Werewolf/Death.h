//
//  Death.h
//  Werewolf
//
//  Created by mac on 13-11-8.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "Event.h"
#import "AppDelegate.h"

@interface Death : UIViewController<clientsocketprotocol>
@property Event* event;
@property BOOL isBeginGetData;
- (IBAction)finalSpeechOver:(id)sender;
-(void)getDataFromServer:(NSData *)data;
@end
