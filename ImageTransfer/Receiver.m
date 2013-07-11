//
//  Receiver.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "Receiver.h"


#define READING_TAG     9999
#define HEADER_TAG      1111
#define BODY_TAG        2222
@interface Receiver () <AsyncSocketDelegate>
@end

@implementation Receiver
{
    AsyncSocket *asyncSocket;
    AsyncSocket *remoteSocket;
    NSMutableData *tmpData;
}

- (id)init
{
    NSAssert(1==0, @"使用 initWithPort: 初始化");
    return nil;
}

- (id)initWithPort:(UInt16)port
{
    self = [super init];
    if (self) {
        self.localPort = port;
        asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
        tmpData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)listen
{
    if ( ![asyncSocket isConnected] )
    {
        NSError *error = NULL;
        if ( ![asyncSocket acceptOnPort:IMAGE_TRANSFER_PORT error:&error] )
            po( error );
    }
}

- (void)disconnect
{
    [asyncSocket disconnect];
}

#pragma mark - Delegate
- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    print_function();
    NSLog(@"Socket disconnect with error:\n%@\n", err);
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    print_function();
    remoteSocket = nil;
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    print_function();
    /* 开始从 socket 中读取字节流 */
    // P.S. 每次收到回调后立即读取数据会断开连接，所以采用延迟一秒后再读数据
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSUInteger length = sizeof(NSUInteger);
        NSMutableData *buffer = [NSMutableData data];
        [remoteSocket readDataToLength:length withTimeout:-1 buffer:buffer bufferOffset:0 tag:HEADER_TAG];
    });
}

- (NSRunLoop *)onSocket:(AsyncSocket *)sock wantsRunLoopForNewSocket:(AsyncSocket *)newSocket
{
    print_function();
    return [NSRunLoop currentRunLoop];
}

- (void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket
{
    print_function();
    NSLog(@"Accept new socket: %@:%u", newSocket.connectedHost, newSocket.connectedPort);
    remoteSocket = newSocket;
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    print_function();
    
    if (HEADER_TAG == tag)
    {
        NSUInteger length = 0;
        [data getBytes:&length length:sizeof(NSUInteger)];
        
        NSMutableData *buffer = [NSMutableData data];
        [remoteSocket readDataToLength:length withTimeout:-1 buffer:buffer bufferOffset:0 tag:BODY_TAG];
    }
    else if (BODY_TAG == tag)
    {
        /* Notify the delegate */
        if ( !self.delegate ) return;
        
        if ([self.delegate respondsToSelector:@selector(receiver:didReceiveData:)])
            [self.delegate receiver:self didReceiveData:data];
    }
}

- (void)onSocket:(AsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    print_function();
}

@end
