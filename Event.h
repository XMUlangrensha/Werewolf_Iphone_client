//
//  Event.h
//  Werewolf
//
//  Created by mac on --.
//  Copyright (c) 年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
    @property  int CLIENT_INFO ;
	@property  int SERVER_ROOM  ;
	@property  int SERVER_JOINED_COUNT;
    
	@property   int SERVER_ALL_ROLE_INFO  ;
	@property   int SERVER_ALL_PLAYER_INFO  ;
	@property   int SERVER_ROLE_INFO  ;
	@property   int SERVER_CLOSE_EYES  ;
	@property   int SERVER_OPEN_EYES  ;
	@property   int SERVER_GAME_RESULT  ;
	@property   int SERVER_YOU_ARE_DEAD  ;
    
	@property   int SERVER_SPEECH_START  ;
	@property   int CLIENT_SPEECH_OVER  ;
	@property   int SERVER_VOTE_START  ;
	@property   int CLIENT_VOTE_ACTION  ;
	@property   int SERVER_VOTE_OVER  ;
    
	/* 竞选 */
	@property   int SERVER_ELECTION_START  ;
	@property   int CLIENT_ELECTION_ACTION  ;
	@property   int SERVER_ELECTION_OVER  ;
	@property   int SERVER_SHERRIF_ID  ;
    
	/* 盗贼 */
	@property   int SERVER_THIEF_START  ;
	@property   int CLIENT_THIEF_ACTION  ;
	@property   int SERVER_THIEF_OVER  ;
    
	/* 丘比特 */
	@property   int SERVER_CUPID_START  ;
	@property   int CLIENT_CUPID_ACTION  ;
	@property   int SERVER_CUPID_OVER  ;
    
	/* 预言家 */
	@property   int SERVER_SEER_START  ;
	@property   int CLIENT_SEER_ACTION  ;
	@property   int SERVER_SEER_OVER  ;
    
	/* 狼人 */
	@property   int SERVER_WOLF_START  ;
	@property   int CLIENT_WOLF_ACTION  ;
	@property   int SERVER_WOLF_ATTEMP_START  ;
	@property   int SERVER_WOLF_ATTEMP_OVER  ;
	@property   int SERVER_WOLF_OVER  ;
    
	/* 女巫 */
	@property   int SERVER_WITCHSAVE_START  ;
	@property   int CLIENT_WITCHSAVE_ACTION  ;
	@property   int SERVER_WITCHSAVE_OVER  ;
	@property   int SERVER_WITCHPOISON_START  ;
	@property   int CLIENT_WITCHPOISON_ACTION  ;
	@property   int SERVER_WITCHPOISON_OVER  ;
    
	/* 猎人 */
	@property   int SERVER_HUNTER_START  ;
	@property   int CLIENT_HUNTER_ACTION  ;
	@property   int SERVER_HUNTER_OVER  ;
    
	/* 警长 */
	@property   int SERVER_SHERIFF_START  ;
	@property   int CLIENT_SHERIFF_ACTION  ;
	@property   int SERVER_SHERIFF_OVER  ;
    
	/* 村民 */
	@property   int SERVER_VILLAGER_START  ;
	@property   int SERVER_EXECUTE_ID  ;
    
	/* 死亡名单 */
	@property   int SERVER_NIGHT_DEATH  ;
    
	/* 游戏结果 */
	@property   int ON_GAME  ;
	@property   int WOLF_WIN  ;
	@property   int VILLAGER_WIN  ;
	@property   int LOVER_WIN  ;
	@property   int EQUAL  ;

@end
