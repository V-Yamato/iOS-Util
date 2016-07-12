//
//  UIColor+Util.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/7.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)
#pragma mark --Hex 
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end

