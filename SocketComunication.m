//
//  SocketComunication.m
//  ClientTest
//
//  Created by fjs on 13-11-2.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "SocketComunication.h"

@implementation SocketComunication



GCDAsyncSocket *clientSocket;
@synthesize delegate = _delegate;

// 连接服务器
- (void)ConnectToSever{
    clientSocket=[[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    //  Ip:"127.0.0.1"  端口：12345
    
    NSError*err=nil;
    [clientSocket connectToHost:@"172.16.9.18" onPort:12345 error:&err];   //实验室IP:  172.16.9.18
    if(err) {
        NSLog(@"socket连接函数调用异常:%@",err);
    }
    

}

-(void)sendArray:(NSArray *)arr{

    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:arr
                                                       options:NSJSONWritingPrettyPrinted error:nil];
    NSString* aStr = [[NSString alloc] initWithData:jsonData encoding:NSASCIIStringEncoding];
    
    
    //IOS里json格式和java里不一样，下面4行将json格式转化成java可以读取的正确格式后发送。
    NSString * temp = [aStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString * sendMes =  [temp stringByAppendingString:@"\n"];
    NSLog(@"发送的数据%@",sendMes);
    NSData *FinalJsonData = [sendMes dataUsingEncoding: NSUTF8StringEncoding];
    
    //发送json转变成的NSData类型的数据。
    
    [clientSocket writeData:FinalJsonData withTimeout:-1 tag:1];
}

#pragma mark  ------GCDAsyncSocket协议--------
//只要一连接上服务器，就会执行下面的代码。
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString*)host port:(uint16_t)port
{
    //读取服务器发来的数据。
    [clientSocket readDataToData:[GCDAsyncSocket LFData] withTimeout:-1 tag:1];
}

//只要读取到数据就执行下面函数，读取的数据是参数data。
- (void)socket:(GCDAsyncSocket *)sender didReadData:(NSData *)data withTag:(long)tag
{
    
    
    [_delegate getDataFromServer:data];
    
    //读取一行数据，读取到就执行(void)socket:(GCDAsyncSocket *)sender didReadData:(NSData *)data withTag:(long)tag，一个循环过程。
    [clientSocket readDataToData:[GCDAsyncSocket LFData]  withTimeout:-1 tag:1];
    
}

//socket连接断开后执行下面函数
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError*)err
{
    NSLog(@"socket连接建立失败:%@",err);
}



@end
