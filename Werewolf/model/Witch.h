//
//  Witch.h
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Role.h"
#import "Player.h"

@interface Witch : Role

@property BOOL hasMedicine;
@property BOOL hasPoison;

-(id) init;
-(BOOL) save:(Player *) toSavePlayer;
-(BOOL) poison:(Player *) toPoisonPlayer;
@end
