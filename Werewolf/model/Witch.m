//
//  Witch.m
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Witch.h"

static BOOL const SAVE = YES;
static BOOL const POISON = NO;

@implementation Witch

@synthesize hasMedicine;
@synthesize hasPoison;

-(id) init{
    self = [super initWithId:WITCH];
    return self;
}
-(BOOL) save:(Player *) toSavePlayer{
    if (hasMedicine) {
        hasMedicine = NO;
        toSavePlayer.role.status = ALIVE;
        return YES;
    }
    return NO;
}
-(BOOL) poison:(Player *) toPoisonPlayer{
    if (hasPoison) {
        hasPoison = NO;
        toPoisonPlayer.role.status = POISONED;
        return YES;
    }
    return NO;
}
@end
