//
//  Vergil_ScrollView.m
//  iOS Util
//
//  Created by 黄聪 on 16/8/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "Vergil_ScrollView.h"

@implementation Vergil_ScrollView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}


#pragma mark --SetUp SubViews
- (void)setUpTitleLabel{
    for (NSString *titleStr in _titleArray) {
        UILabel *titleLbl = [[UILabel alloc]init];
        titleLbl.text=titleStr;
        [titleLbl addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setAnimationStartDate:)]];
        
    }
}


#pragma mark --Actions

//- (void)









@end
