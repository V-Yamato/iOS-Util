//
//  Vergil_ScrollView.h
//  iOS Util
//
//  Created by 黄聪 on 16/8/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^titleClickBlock)(void);

@interface Vergil_ScrollView : UIScrollView

@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,copy)titleClickBlock titleblock;

@end
