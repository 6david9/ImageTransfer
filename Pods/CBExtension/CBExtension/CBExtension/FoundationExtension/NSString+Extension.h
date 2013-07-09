//
//  NSString+Extension.h
//  CBExtension
//
//  Created by ly on 13-6-29.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSMutableArray *)itemsForPattern:(NSString *)pattern;
- (NSMutableArray *)itemsForPattern:(NSString *)pattern captureGroupIndex:(NSUInteger)index;

- (NSString *)itemForPatter:(NSString *)pattern;
- (NSString *)itemForPattern:(NSString *)pattern captureGroupIndex:(NSUInteger)index;

- (NSTimeInterval)timeIntervalFromString:(NSString *)timeString withDateFormat:(NSString *)format;          // +0000 时区时间
- (NSTimeInterval)localTimeIntervalFromString:(NSString *)timeString withDateFormat:(NSString *)format;     // 带时区的本地时间

@end
