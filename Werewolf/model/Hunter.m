//
//  Hunter.m
//  Werewolf
//
//  Created by anne on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Hunter.h"

@implementation Hunter

@synthesize hasGun=_hasGun;
-(id) init{
    self=[super initWithId:HUNTER];
    return self;
};
-(BOOL)hunt:(Player*) toHuntPlayer{
    if (_hasGun && (toHuntPlayer.role.status == KILLED || toHuntPlayer.role.status == EXECUTED)) {
        toHuntPlayer.role.status= HUNTED;
        _hasGun = false;
        return true;
    }
    return false;
}

@end