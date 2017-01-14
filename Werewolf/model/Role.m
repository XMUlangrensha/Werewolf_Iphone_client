//
//  Role.m
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Role.h"

int const CUPID=1;
int const HUNTER = 2;
int const SEER = 3;
int const THIEF = 4;
int const VILLAGER = 5;
int const WITCH = 6;
int const WOLF = 7;

int const ALIVE = 1;
int const KILLED = 2;
int const POISONED = 3;
int const SUICIDED = 4;
int const HUNTED = 5;
int const EXECUTED = 6;

int deadCount=0;

@implementation Role



@synthesize roleId;
@synthesize name;
@synthesize isSheriff;
@synthesize loverId;
@synthesize status;
@synthesize aliveDay;
@synthesize deadNum;
@synthesize voteList;




-(NSString *) toRoleName:(int)theId{
    NSString *str = nil;
    switch (theId) {
		case CUPID:
			str = @"丘比特";
			break;
		case HUNTER:
			str = @"猎人";
			break;
		case SEER:
			str = @"预言家";
			break;
		case THIEF:
			str = @"盗贼";
			break;
		case VILLAGER:
			str = @"村民";
			break;
		case WITCH:
			str = @"女巫";
			break;
		case WOLF:
			str = @"狼人";
			break;
    }
    return str;
}
-(Role *) initWithId:(int) theId{
    self.roleId= theId;
    self.name=[self toRoleName:theId];
    self.loverId=0;
    status=ALIVE;
    self.isSheriff=NO;
    self.voteList=[NSArray init];
    self.aliveDay=1;
    self.deadNum=0;
    return self;
}

-(void) setRoleStatus:(int) type{
    self.status = type;
    if (self.status != ALIVE) {
        deadCount++;
        deadNum = deadCount;
    } else {
        deadCount--;
        deadNum = 0;
    }
}

-(int) getroleStatus{
    return status;
}

@end
