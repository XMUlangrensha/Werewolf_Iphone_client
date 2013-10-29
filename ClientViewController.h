//
//  ClientViewController.h
//  ClientTest
//
//  Created by mac on 13-10-27.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface ClientViewController : UIViewController<GCDAsyncSocketDelegate>
{
}
@property NSNumber * eventType;
@property NSNumber * identity;
@property NSString* name;
@property NSNumber *isOwner;
@property NSString *otherInfo;
@property NSArray *ARR;



- (IBAction)ConnectToSever:(id)sender;


@end
