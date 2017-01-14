//
//  Player.h
//  Werewolf
//
//  Created by mac on 13-11-6.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Role.h"
@interface Player : NSObject

@property NSNumber* playerId;
@property int roleId;
@property NSString *name;
@property Role *role;
@property NSNumber* isOwner;

@end
