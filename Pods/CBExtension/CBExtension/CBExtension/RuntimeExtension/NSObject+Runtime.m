//
//  NSObject+Runtime.m
//  CBExtension
//
//  Created by  ly on 13-6-15.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

- (NSString *)className
{
    return [[NSString alloc] initWithCString:object_getClassName(self)
                                    encoding:NSUTF8StringEncoding];
}

- (NSArray *)conformedProtocols
{
    unsigned int outCount = 0;
    Class obj_class = [self class];
    __unsafe_unretained Protocol **protocols = class_copyProtocolList(obj_class, &outCount);
    
    NSMutableArray *protocol_array = nil;
    if (outCount > 0)
    {
        protocol_array = [[NSMutableArray alloc] initWithCapacity:outCount];
        
        for (NSInteger i = 0; i < outCount; i++)
        {
            NSString *protocol_name_string;
            const char *protocol_name = protocol_getName(protocols[i]);
            protocol_name_string = [[NSString alloc] initWithCString:protocol_name
                                                            encoding:NSUTF8StringEncoding];
            [protocol_array addObject:protocol_name_string];
        }
    }
    
    return protocol_array;
}

@end
