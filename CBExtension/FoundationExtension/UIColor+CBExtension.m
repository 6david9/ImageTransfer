//
//  UIColor+CBExtension.m
//  CBExtension
//
//  Created by ly on 13-9-24.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "UIColor+CBExtension.h"

@implementation UIColor (CBExtension)

+ (UIColor *)colorWithHex:(uint)hex
{
    // https://github.com/aberger/abmtoolbox/blob/master/ABMToolbox/categories/UIColor%2BABMToolboxColor.m
	int blue = hex & 0x000000FF;
	int green = ((hex & 0x0000FF00) >> 8);
	int red = ((hex & 0x00FF0000) >> 16);
    
	return [UIColor colorWithRed:red / 255.0
                           green:green / 255.0
                            blue:blue / 255.0
                           alpha:1.0];
}

@end
