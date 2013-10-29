//
//  ClientViewController.m
//  ClientTest
//
//  Created by mac on 13-10-27.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ClientViewController.h"
#import "GCDAsyncSocket.h"

@interface ClientViewController ()
@end

@implementation ClientViewController

GCDAsyncSocket *clientSocket;

@synthesize eventType;
@synthesize identity;
@synthesize name;
@synthesize isOwner;
@synthesize ARR;
@synthesize otherInfo;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
    //初始化 事件类型， 身份id ，名字 ， 是否owner ， 其他信息.....
    eventType = [NSNumber numberWithInt:0];
    identity = [NSNumber numberWithInt:0];
    name = @"vfg";
    isOwner = [NSNumber numberWithBool:true];
    otherInfo = @"6";
	
}
// 连接服务器........
- (IBAction)ConnectToSever:(id)sender {
    //
    clientSocket=[[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
   //  Ip:"127.0.0.1"  端口：12345
    NSError*err=nil;
    [clientSocket connectToHost:@"127.0.0.1" onPort:12345 error:&err];
    if(err) {
        NSLog(@"socket连接函数调用异常:%@",err);
    }
    
    
}

#pragma mark  ------GCDAsyncSocket协议--------
//只要一连接上服务器，就会执行下面的代码。
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString*)host port:(uint16_t)port
{
    
    NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          identity,@"id",
                          name,@"name",
                          isOwner,@"isOwner",nil];
    
    ARR = [NSArray arrayWithObjects:eventType,info,otherInfo, nil];
    
    //将数组ARR转变成json格式
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:ARR
                                                       options:NSJSONWritingPrettyPrinted error:nil];
    NSString* aStr = [[NSString alloc] initWithData:jsonData encoding:NSASCIIStringEncoding];
    

    //IOS里json格式和java里不一样，下面4行将json格式转化成java可以读取的正确格式后发送。
    NSString * temp = [aStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString * sendMes =  [temp stringByAppendingString:@"\n"];
    NSData *FinalJsonData = [sendMes dataUsingEncoding: NSUTF8StringEncoding];
    
    //发送json转变成的NSData类型的数据。
    [clientSocket writeData:FinalJsonData withTimeout:-1 tag:1];

    //读取服务器发来的数据。
    [clientSocket readDataToData:[GCDAsyncSocket LFData] withTimeout:-1 tag:1];
}

//只要读取到数据就执行下面函数，读取的数据是参数data。
- (void)socket:(GCDAsyncSocket *)sender didReadData:(NSData *)data withTag:(long)tag
{
    NSError *err;
    NSArray * parsedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"%@", aStr);
    for (NSString *string in parsedData) {
        NSLog(@"%@", string);
    }
    
    
//读取一行数据，读取到就执行(void)socket:(GCDAsyncSocket *)sender didReadData:(NSData *)data withTag:(long)tag，一个循环过程。
    [clientSocket readDataToData:[GCDAsyncSocket LFData]  withTimeout:-1 tag:1];

}

//socket连接断开后执行下面函数
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError*)err
{
    NSLog(@"socket连接建立失败:%@",err);
}


@end
