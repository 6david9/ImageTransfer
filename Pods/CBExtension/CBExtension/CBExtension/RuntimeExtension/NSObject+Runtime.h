//
//  NSObject+Runtime.h
//  CBExtension
//
//  Created by  ly on 13-6-15.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

- (NSString *)className;
- (NSArray *)conformedProtocols;

@end
