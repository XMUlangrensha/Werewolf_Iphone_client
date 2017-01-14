//
//  AppDelegate.h
//  Werewolf
//
//  Created by mac on 13-10-24.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "Player.h"
#import "Event.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{ SocketComunication *ClientSocket;
}

@property (strong, nonatomic) UIWindow *window;
@property SocketComunication *ClientSocket;
@property Player *player;
@property Event* event;
@property NSArray *allPlayNameArr;
@property int gameResult;

+(AppDelegate*)app;
+(NSNumber*)getIdByName:(NSString*)name;
@end
