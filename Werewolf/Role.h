//
//  Role.h
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Role : NSObject

@property int roleId;
@property NSString *name;
@property BOOL isSheriff;
@property int loverId;

//@property int status;

@property int aliveDay;

@property int deadNum;

@property NSArray *voteList;


-(NSString *) toRoleName:(int)roleId;
-(void) initWithId:(int) id;
-(void) setStatus:(int) type;
@end
