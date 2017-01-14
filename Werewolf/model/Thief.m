//
//  Thief.m
//  Werewolf
//
//  Created by anne on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Thief.h"
#import "Cupid.h"
#import "Hunter.h"
#import "Seer.h"
#import "Wolf.h"
#import "Witch.h"
#import "Villager.h"

@implementation Thief
-(id) init{
    self = [super initWithId:THIEF];
    return self;
    
}
-(id) steal:(int) newRoleId{
    Role *newRole;
    switch (newRoleId) {
            //识别不了CUPID、SEER那些常量??
        case 1:
			newRole =[[Cupid alloc] init];
			break;
		case 2:
			newRole = [[Hunter alloc] init];
			break;
		case 3:
			newRole = [[Seer alloc] init];
			break;
		case 5:
			newRole = [[Villager alloc] init];
			break;
		case 6:
			newRole = [[Witch alloc] init];
			break;
		case 7:
			newRole = [[Wolf alloc] init];
			break;
    }
    return newRole;
}
@end
