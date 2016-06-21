//
//  TTConst.h
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#ifndef TTConst_h
#define TTConst_h
#define ScreenWidth      [UIScreen mainScreen].bounds.size.width
#define ScreenHeight      [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#endif /* TTConst_h */
