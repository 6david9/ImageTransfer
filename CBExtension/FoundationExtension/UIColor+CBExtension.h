//
//  UIColor+CBExtension.h
//  CBExtension
//
//  Created by ly on 13-9-24.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CBExtension)

/** 通过 16 进制的颜色值创建 UIColor 对象 */
+ (UIColor *)colorWithHex:(uint)hex;

@end
