//
//  Waiting.h
//  Werewolf
//
//  Created by mac on 13-11-6.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "AppDelegate.h"
#import "Event.h"
@interface Waiting : UIViewController<clientsocketprotocol>
@property (weak, nonatomic) IBOutlet UILabel *showRoomNum;

@property (weak, nonatomic) IBOutlet UILabel *showNum;
@property (weak, nonatomic) IBOutlet UITextView *infoBox;
@property Event* event;
-(void)getDataFromServer:(NSData *)data;
@end
