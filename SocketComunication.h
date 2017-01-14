//
//  SocketComunication.h
//  ClientTest
//
//  Created by fjs on 13-11-2.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@protocol clientsocketprotocol

-(void)getDataFromServer:(NSData *)data;

@end

@interface SocketComunication : NSObject<GCDAsyncSocketDelegate>

@property (nonatomic,weak) IBOutlet id<clientsocketprotocol> delegate;


- (void)ConnectToSever;
- (void)sendArray:(NSArray *)arr;
@end
