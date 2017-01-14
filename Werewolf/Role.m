//
//  Role.m
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Role.h"

static int const  CUPID = 1;
static int const HUNTER = 2;
static int const SEER = 3;
static int const THIEF = 4;
static int const VILLAGER = 5;
static int const WITCH = 6;
static int const WOLF = 7;

static int const ALIVE = 1;
static int const KILLED = 2;
static int const POISONED = 3;
static int const SUICIDED = 4;
static int const HUNTED = 5;
static int const EXECUTED = 6;

static int deadCount=0;
int status;
@implementation Role



@synthesize roleId;
@synthesize name;
@synthesize isSheriff;
@synthesize loverId;
//@synthesize status;
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
-(void) initWithId:(int) theId{
    self.roleId= theId;
    self.name=[self toRoleName:theId];
    self.loverId=0;
    status=ALIVE;
    self.isSheriff=NO;
    self.voteList=[NSArray init];
    self.aliveDay=1;
    self.deadNum=0;
}

-(void) setStatus:(int) type{
    status = type;
    if (status != ALIVE) {
        deadCount++;
        deadNum = deadCount;
    } else {
        deadCount--;
        deadNum = 0;
    }
}

@end
