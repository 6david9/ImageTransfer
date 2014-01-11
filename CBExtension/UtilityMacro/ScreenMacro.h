//
//  ScreenMacro.h
//  CBExtension
//
//  Created by ly on 13-7-14.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#ifndef CBExtension_ScreenMacro_h
#define CBExtension_ScreenMacro_h

#define ScreenScale()     [[UIScreen mainScreen] scale]

#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

#define Main_Screen_Height      ([[UIScreen mainScreen] bounds].size.height)
#define Main_Screen_Width       ([[UIScreen mainScreen] bounds].size.width)

#define App_Frame_Height        ([[UIScreen mainScreen] applicationFrame].size.height)
#define App_Frame_Width         ([[UIScreen mainScreen] applicationFrame].size.width)

#endif
