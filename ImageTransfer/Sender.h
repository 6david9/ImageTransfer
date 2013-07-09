//
//  Sender.h
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sender : NSObject

StrongProperty NSString *remoteAddress;
AssignProperty UInt16 remotePort;

- (id)initWithRemoteAddress:(NSString *)address onPort:(UInt16)port;
- (void)sendData:(NSData *)data;

@end
