//
//  Wolf.h
//  Werewolf
//
//  Created by student on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Role.h"
#import "Player.h"

@interface Wolf : Role

-(id) init;
-(void) kill:(Player *) toKillPlayer;

@end
