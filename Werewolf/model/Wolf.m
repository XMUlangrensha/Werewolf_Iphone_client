//
//  Wolf.m
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Wolf.h"

@implementation Wolf

-(id) init{
    self = [super initWithId:WOLF];
    return self;
    
}
-(void) kill:(Player *) toKillPlayer{
    
    toKillPlayer.role.status = KILLED;
}

@end
