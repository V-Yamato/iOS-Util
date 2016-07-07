//
//  UIColor+Util.h
//  iOS Util
//
//  Created by 黄聪 on 16/7/7.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

#pragma mark --Hex
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

@end
