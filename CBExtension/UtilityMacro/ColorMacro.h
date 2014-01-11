//
//  ColorMacro.h
//  CBExtension
//
//  Created by  ly on 13-5-28.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#ifndef ColorMacro_h
#define ColorMacro_h

#ifdef RGBAlphaColor
#undef RGBAlphaColor
#endif

#ifdef OpaqueRGBColor
#undef OpaqueRGBColor
#endif

#define RGBAlphaColor(r, g, b, a) \
[UIColor colorWithRed:(r/255.0)\
                green:(g/255.0)\
                 blue:(b/255.0)\
                alpha:(a)]

#define OpaqueRGBColor(r, g, b) RGBAlphaColor((r), (g), (b), 1.0)

#define HexColor(c)   [UIColor colorWithHex:0x##c]

//#define HexColor(rgb) \
//[UIColor colorWithRed:((float)((0x##rgb & 0xFF0000) >> 16))/255.0 \
//green:((float)((0x##rgb & 0xFF00) >> 8))/255.0 \
//blue:((float)(0x##rgb & 0xFF))/255.0 \
//alpha:1.0]


#define BlackColor      [UIColor blackColor]
#define DarkGrayColor   [UIColor darkGrayColor]
#define LightGrayColor  [UIColor lightGrayColor]
#define WhiteColor      [UIColor whiteColor]
#define GrayColor       [UIColor grayColor]
#define RedColor        [UIColor redColor]
#define GreenColor      [UIColor greenColor]
#define BlueColor       [UIColor blueColor]
#define CyanColor       [UIColor cyanColor]
#define YellowColor     [UIColor yellowColor]
#define MagentaColor    [UIColor magentaColor]
#define OrangeColor     [UIColor orangeColor]
#define PurpleColor     [UIColor purpleColor]
#define BrownColor      [UIColor brownColor]
#define ClearColor      [UIColor clearColor]


#endif
