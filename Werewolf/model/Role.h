//
//  Role.h
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

extern int const CUPID;
extern int const HUNTER;
extern int const SEER;
extern int const THIEF;
extern int const VILLAGER;
extern int const WITCH;
extern int const WOLF;

extern int const ALIVE;
extern int const KILLED;
extern int const POISONED;
extern int const SUICIDED;
extern int const HUNTED;
extern int const EXECUTED;

extern int deadCount;
//extern int status;
@interface Role : NSObject

@property int roleId;
@property NSString *name;
@property BOOL isSheriff;
@property int loverId;

@property int status;

@property int aliveDay;

@property int deadNum;

@property NSArray *voteList;



-(NSString *) toRoleName:(int)roleId;
-(Role *) initWithId:(int) id;
-(void) setRoleStatus:(int) type;
-(int) getroleStatus;
@end
