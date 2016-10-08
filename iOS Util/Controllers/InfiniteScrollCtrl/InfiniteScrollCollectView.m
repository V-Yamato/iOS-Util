//
//  InfiniteScrollCollectView.m
//  iOS Util
//
//  Created by 左文涛 on 16/9/30.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "InfiniteScrollCollectView.h"
#import "InfiniteCell.h"

@interface InfiniteScrollCollectView()

@property (assign,nonatomic)BOOL firstLoad;
@property (assign,nonatomic)NSInteger imgNum;

@end


@implementation InfiniteScrollCollectView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self ==  [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        [self setupSubViews];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        self.delegate = self;
        self.dataSource = self;
        [self setupSubViews];
    }
    return self;
}


#pragma mark -- Data&SubViews
- (void)setupSubViews {
    _firstLoad = YES;
    _imgNum = 5;
    self.pagingEnabled =YES;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_firstLoad) {
        [self setContentOffset:CGPointMake(320, 0)];
        _firstLoad = NO;
    }
}




#pragma mark -- Scroll Delegates
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
////    float contentOffsetScrolledRight = self.frame.size.width * (5 -1);
////    if (scrollView.contentOffset.x >= contentOffsetScrolledRight) {
////        NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
////        [self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
////    }
////    else if (scrollView.contentOffset.x <= 0){
////        NSIndexPath *path = [NSIndexPath indexPathForRow:5-2 inSection:0];
////        [self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
////    }
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGFloat width = self.frame.size.width;
    NSLog(@"%f",offset.x );

    if (offset.x < 0)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:3-2 inSection:0];
        [self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    }
    else if (offset.x > 3*width)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
        [self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
//    根据偏移量计算出当前页码数
//    NSInteger imageIndex = self.rootScrollView.contentOffset.x / width + 0.5;
//    self.imagePage.currentPage = self.imageIndex - 1;
}



#pragma mark -- CollectionView DataSources
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InfiniteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"1" forIndexPath:indexPath];

    if (indexPath.row ==0) {
        [cell setBackgroundColor:[UIColor yellowColor]];
    }else if (indexPath.row ==1) {
        [cell setBackgroundColor:[UIColor blackColor]];
        
    }else if (indexPath.row ==2) {
        [cell setBackgroundColor:[UIColor redColor]];
        
    }
    return cell;
}


#pragma mark -- CollectionView LayOut
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH,self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
