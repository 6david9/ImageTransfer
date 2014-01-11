//
//  ViewMacro.h
//  CBExtension
//
//  Created by ly on 13-12-16.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#ifndef CBExtension_ViewMacro_h
#define CBExtension_ViewMacro_h

#define X(v)      ((v).frame.origin.x)
#define Y(v)      ((v).frame.origin.y)
#define WIDTH(v)  ((v).frame.size.width)
#define HEIGHT(v) ((v).frame.size.height)

#define MinX(v)   CGRectGetMinX((v).frame)
#define MinY(v)   CGRectGetMinY((v).frame)

#define MidX(v)   CGRectGetMidX((v).frame)
#define MidY(v)   CGRectGetMidY((v).frame)

#define MaxX(v)   CGRectGetMaxX((v).frame)
#define MaxY(v)   CGRectGetMaxY((v).frame)

#endif
