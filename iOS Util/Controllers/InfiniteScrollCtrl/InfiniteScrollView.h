//
//  InfiniteScrollView.h
//  iOS Util
//
//  Created by 左文涛 on 16/10/10.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfiniteScrollView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,copy)NSArray *imgArray;

@end
