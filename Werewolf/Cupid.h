//
//  Cupid.h
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "Role.h"
#import "Player.h"

@interface Cupid : Role

-(id) init;
-(void) shoot:(Player *) first secondOne:(Player *) second;
@end
