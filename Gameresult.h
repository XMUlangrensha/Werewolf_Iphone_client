//
//  Gameresult.h
//  Werewolf
//
//  Created by mac on 13-11-11.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketComunication.h"
#import "Event.h"
#import "AppDelegate.h"
@interface Gameresult : UIViewController<clientsocketprotocol>
@property int gameResult;
@property Event* event;
@property (weak, nonatomic) IBOutlet UILabel *gameEnd;
-(void)getDataFromServer:(NSData *)data;
@end
