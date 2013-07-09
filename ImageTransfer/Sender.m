//
//  Sender.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "Sender.h"


#define  SENDING_TAG        10000
@interface Sender () <AsyncSocketDelegate>

@end

@implementation Sender
{
    AsyncSocket *asyncSocket;
}

- (id)init
{
    NSAssert(1==0, @"使用 initWithPort: 初始化");
    return nil;
}
- (id)initWithRemoteAddress:(NSString *)address onPort:(UInt16)port
{
    self = [super init];
    if (self) {
        self.remoteAddress = address;
        self.remotePort    = port;
        
        asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    }
    return self;
}

- (void)sendData:(NSData *)data
{
    if ( [self connectToRemote] )
    {
        NSData *sendingData = [self prepareData:data];
        [asyncSocket writeData:sendingData withTimeout:3.0 tag:SENDING_TAG];
        [asyncSocket disconnectAfterWriting];
    }
}

- (NSData *)prepareData:(NSData *)data
{
    NSMutableData *sendingData = [[NSMutableData alloc] init];
    [sendingData appendData:data];
    [sendingData appendData:[AsyncSocket CRLFData]];
    return sendingData;
}

- (BOOL)connectToRemote
{
    BOOL success = YES;
    NSError *error = nil;
    if ( ![asyncSocket connectToHost:self.remoteAddress onPort:self.remotePort error:&error] )
    {
        success = NO;
        NSLog(@"Could not connet to %@:%d", self.remoteAddress, self.remotePort);
    }
    if (error)
    {
        success = NO;
        po(error);
    }
    return success;
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
}

- (void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket
{
    print_function();
    NSLog(@"Accept new socket: %@:%u", newSocket.connectedHost, newSocket.connectedPort);
}

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock
{
    print_function();
    return YES;
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    print_function();
    NSLog(@"Socket did Connect to host: %@:%u", host, port);
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    print_function();
    NSLog(@"Socket write data with tag: %ld", tag);
}

- (void)onSocket:(AsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    print_function();
    NSLog(@"Socket write data with tag: %ld\npartialLength: %u\n", tag, partialLength);
}

@end
