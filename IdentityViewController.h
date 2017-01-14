//
//  IdentityViewController.h
//  Werewolf
//
//  Created by mac on 13-11-10.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "Event.h"
#import "AppDelegate.h"
#import "IDCardView.h"
@interface IdentityViewController : UIViewController<clientsocketprotocol>

@property Event *event;
-(void)getDataFromServer:(NSData *)data;
@end
