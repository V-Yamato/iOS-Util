//
//  CALayer+Util.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/7.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "CALayer+Util.h"

@implementation CALayer (Util)


#pragma mark --Border Color
-(void)setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

-(UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}


@end
