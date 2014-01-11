//
//  ImageMacro.h
//  CBExtension
//
//  Created by  ly on 13-6-15.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#ifndef ImageMacro_h
#define ImageMacro_h

#define CachedImage(image)   [UIImage imageNamed:(image)]
#define ImageWithPath(path)  [UIImage imageWithContentsOfFile:(path)]

#define PNGImage(NAME)       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGImage(NAME)       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]

#endif
