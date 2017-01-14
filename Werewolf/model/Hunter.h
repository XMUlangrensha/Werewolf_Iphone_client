//
//  Hunter.h
//  Werewolf
//
//  Created by anne on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Role.h"
#import "Player.h"
@interface Hunter : Role
@property BOOL hasGun;
-(id) init;
-(BOOL) hunt:(Player*) toHuntPlayer;
@end
