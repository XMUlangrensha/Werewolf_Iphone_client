//
//  Cupid.m
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Cupid.h"

@implementation Cupid

-(id) init{
    self=[super initWithId:CUPID];
    return self;
}
-(void) shoot:(Player *) first secondOne:(Player *) second{
    first.role.loverId = [second playerId];
    second.role.loverId = [first playerId];
    
}

@end
