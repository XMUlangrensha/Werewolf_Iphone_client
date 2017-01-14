//
//  MySocket.h
//  Werewolf
//
//  Created by anne on 13-11-1.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@interface MySocket : NSObject<GCDAsyncSocketDelegate>{}
@property NSNumber * eventType;
@property NSNumber * identity;
@property NSString* name;
@property NSNumber *isOwner;
@property NSString *otherInfo;
@property NSArray *ARR;
-(id)init;
+(void)ConnectToSever;
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString*)host port:(uint16_t)port;
@end
