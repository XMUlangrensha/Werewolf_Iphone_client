//
//  Event.m
//  Werewolf
//
//  Created by mac on 13-11-7.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize   CLIENT_INFO ;
@synthesize   SERVER_ROOM  ;
@synthesize   SERVER_JOINED_COUNT;

@synthesize    SERVER_ALL_ROLE_INFO  ;
@synthesize    SERVER_ALL_PLAYER_INFO  ;
@synthesize    SERVER_ROLE_INFO  ;
@synthesize    SERVER_CLOSE_EYES  ;
@synthesize    SERVER_OPEN_EYES  ;
@synthesize    SERVER_GAME_RESULT  ;
@synthesize    SERVER_YOU_ARE_DEAD  ;

@synthesize    SERVER_SPEECH_START  ;
@synthesize    CLIENT_SPEECH_OVER  ;
@synthesize    SERVER_VOTE_START  ;
@synthesize    CLIENT_VOTE_ACTION  ;
@synthesize    SERVER_VOTE_OVER  ;

/* 竞选 */
@synthesize    SERVER_ELECTION_START  ;
@synthesize    CLIENT_ELECTION_ACTION  ;
@synthesize    SERVER_ELECTION_OVER  ;
@synthesize    SERVER_SHERRIF_ID  ;

/* 盗贼 */
@synthesize    SERVER_THIEF_START  ;
@synthesize    CLIENT_THIEF_ACTION  ;
@synthesize    SERVER_THIEF_OVER  ;

/* 丘比特 */
@synthesize    SERVER_CUPID_START  ;
@synthesize    CLIENT_CUPID_ACTION  ;
@synthesize    SERVER_CUPID_OVER  ;

/* 预言家 */
@synthesize    SERVER_SEER_START  ;
@synthesize    CLIENT_SEER_ACTION  ;
@synthesize    SERVER_SEER_OVER  ;

/* 狼人 */
@synthesize    SERVER_WOLF_START  ;
@synthesize    CLIENT_WOLF_ACTION  ;
@synthesize    SERVER_WOLF_ATTEMP_START  ;
@synthesize    SERVER_WOLF_ATTEMP_OVER  ;
@synthesize    SERVER_WOLF_OVER  ;

/* 女巫 */
@synthesize    SERVER_WITCHSAVE_START  ;
@synthesize    CLIENT_WITCHSAVE_ACTION  ;
@synthesize    SERVER_WITCHSAVE_OVER  ;
@synthesize    SERVER_WITCHPOISON_START  ;
@synthesize    CLIENT_WITCHPOISON_ACTION  ;
@synthesize    SERVER_WITCHPOISON_OVER  ;

/* 猎人 */
@synthesize    SERVER_HUNTER_START  ;
@synthesize    CLIENT_HUNTER_ACTION  ;
@synthesize    SERVER_HUNTER_OVER  ;

/* 警长 */
@synthesize    SERVER_SHERIFF_START  ;
@synthesize    CLIENT_SHERIFF_ACTION  ;
@synthesize    SERVER_SHERIFF_OVER  ;

/* 村民 */
@synthesize    SERVER_VILLAGER_START  ;
@synthesize    SERVER_EXECUTE_ID  ;

/* 死亡名单 */
@synthesize    SERVER_NIGHT_DEATH  ;

/* 游戏结果 */
@synthesize    ON_GAME  ;
@synthesize    WOLF_WIN  ;
@synthesize    VILLAGER_WIN  ;
@synthesize    LOVER_WIN  ;
@synthesize    EQUAL  ;
-(Event*)init{
    self = [super init];
    
        CLIENT_INFO = 0;
	    SERVER_ROOM = 1;
	    SERVER_JOINED_COUNT = 2;
    
	    SERVER_ALL_ROLE_INFO = 10;
	    SERVER_ALL_PLAYER_INFO = 11;
	    SERVER_ROLE_INFO = 12;
	    SERVER_CLOSE_EYES = 13;
	    SERVER_OPEN_EYES = 14;
	    SERVER_GAME_RESULT = 15;
	    SERVER_YOU_ARE_DEAD = 16;
    
	    SERVER_SPEECH_START = 23;
	    CLIENT_SPEECH_OVER = 24;
	    SERVER_VOTE_START = 25;
	    CLIENT_VOTE_ACTION = 26;
	    SERVER_VOTE_OVER = 27;
    
	/* 竞选 */
	    SERVER_ELECTION_START = 20;
	    CLIENT_ELECTION_ACTION = 21;
	    SERVER_ELECTION_OVER = 22;
	    SERVER_SHERRIF_ID = 28;
    
	/* 盗贼 */
	    SERVER_THIEF_START = 30;
	    CLIENT_THIEF_ACTION = 31;
	    SERVER_THIEF_OVER = 32;
    
	/* 丘比特 */
	    SERVER_CUPID_START = 40;
	    CLIENT_CUPID_ACTION = 41;
	    SERVER_CUPID_OVER = 42;
    
	/* 预言家 */
	    SERVER_SEER_START = 50;
	    CLIENT_SEER_ACTION = 51;
	    SERVER_SEER_OVER = 52;
    
	/* 狼人 */
	    SERVER_WOLF_START = 60;
	    CLIENT_WOLF_ACTION = 61;
	    SERVER_WOLF_ATTEMP_START = 62;
	    SERVER_WOLF_ATTEMP_OVER = 63;
	    SERVER_WOLF_OVER = 64;
    
	/* 女巫 */
	    SERVER_WITCHSAVE_START = 70;
	    CLIENT_WITCHSAVE_ACTION = 71;
	    SERVER_WITCHSAVE_OVER = 72;
	    SERVER_WITCHPOISON_START = 73;
	    CLIENT_WITCHPOISON_ACTION = 74;
	    SERVER_WITCHPOISON_OVER = 75;
    
	/* 猎人 */
	    SERVER_HUNTER_START = 80;
	    CLIENT_HUNTER_ACTION = 81;
	    SERVER_HUNTER_OVER = 82;
    
	/* 警长 */
	    SERVER_SHERIFF_START = 90;
	    CLIENT_SHERIFF_ACTION = 91;
	    SERVER_SHERIFF_OVER = 92;
    
	/* 村民 */
	    SERVER_VILLAGER_START = 100;
	    SERVER_EXECUTE_ID = 103;
    
	/* 死亡名单 */
	    SERVER_NIGHT_DEATH = 110;
    
	/* 游戏结果 */
	    ON_GAME = 0;
	    WOLF_WIN = 1;
	    VILLAGER_WIN = 2;
	    LOVER_WIN = 3;
	    EQUAL = 4;
    return self;
}
@end
