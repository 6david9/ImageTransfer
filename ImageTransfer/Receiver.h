//
//  Receiver.h
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Receiver;
@protocol ReceiverDelegate <NSObject>

@optional
- (void)receiver:(Receiver *)receiver didReceiveData:(NSData *)data;

@end

@interface Receiver : NSObject

AssignProperty UInt16 localPort;
WeakProperty id<ReceiverDelegate> delegate;

- (id)initWithPort:(UInt16)port;

/* 每次 disconnect 后重新 listen */
- (void)listen;

- (void)disconnect;

@end
