//
//  LogMacro.h
//  CBExtension
//
//  Created by ly on 13-6-29.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#ifndef LogMacro_h
#define LogMacro_h


#ifdef DEBUG
#define CBLog(format, ...)   NSLog(format, ##__VA_ARGS__)
#else
#define CBLog(format, ...)  do{ }while(0)
#endif

#define po(obj)              CBLog(@"%@", obj)
#define pi(var_i)            CBLog(@"%d", var_i)
#define pf(var_f)            CBLog(@"%f", var_f)
#define print_function()     CBLog(@"%s", __PRETTY_FUNCTION__)


#endif
