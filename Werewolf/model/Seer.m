//
//  Seer.m
//  Werewolf
//
//  Created by anne on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Seer.h"

@implementation Seer
-(id) init{
    self = [super initWithId:SEER];
    return self;
    
}
-(int) see:(Player *) toSeePlayer{
    return toSeePlayer.role.roleId;
}
@end
