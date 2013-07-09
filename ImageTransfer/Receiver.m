//
//  Receiver.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "Receiver.h"


#define READING_TAG     9999
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
        {
            po( error );
        }
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
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [remoteSocket readDataWithTimeout:-1 tag:READING_TAG];
//        [remoteSocket readDataToLength:1024*8*10 withTimeout:-1 tag:READING_TAG];
        [remoteSocket readDataToData:[AsyncSocket CRLFData] withTimeout:-1 buffer:tmpData bufferOffset:0 maxLength:1024*80 tag:READING_TAG];
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
    if (READING_TAG != tag) return;
    
    print_function();
    
    if ( !self.delegate )
        return;
    
    if ([self.delegate respondsToSelector:@selector(receiver:didReceiveData:)]) {
        [self.delegate receiver:self didReceiveData:data];
    }
    [self disconnect];
    [self listen];
    
    pi( [data length] );
}

- (void)onSocket:(AsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    print_function();
}

@end
