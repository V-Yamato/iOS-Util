//
//  InfiniteScrollView.m
//  iOS Util
//
//  Created by 左文涛 on 16/10/10.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "InfiniteScrollView.h"
#import "InfiniteCell.h"

@interface InfiniteScrollView() {
    UICollectionView *collView;
    BOOL firstLoad;
    UIPageControl *pageCtrl;
}

@end

@implementation InfiniteScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self ==  [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self setupSubViews];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [collView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [pageCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-10);
    }];
}

#pragma mark --SubViews Data
- (void)setupSubViews {
    firstLoad=YES;
    _imgArray = @[@"1",@"2",@"3"];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    collView.delegate=self;
    collView.dataSource=self;
    collView.pagingEnabled=YES;
    [collView registerClass:[InfiniteCell class] forCellWithReuseIdentifier:@"11"];
    [self addSubview:collView];
    pageCtrl = [[UIPageControl alloc]init];
    pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageCtrl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (firstLoad) {
        [collView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
        firstLoad = NO;
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
        NSIndexPath *path = [NSIndexPath indexPathForRow:[_imgArray count] inSection:0];
        [collView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    }
    else if (offset.x > ([_imgArray count]+1)*width)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
        [collView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }else if (offset.x<width) {
        pageCtrl.currentPage = [_imgArray count];
    }else if (offset.x>[_imgArray count]*width) {
        pageCtrl.currentPage = 0;
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
    return [_imgArray count]+2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"11";
    
    InfiniteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (indexPath.row ==0) {
        [cell setBackgroundColor:[UIColor yellowColor]];
        return cell;
    }else if (indexPath.row ==[_imgArray count]+1) {
        [cell setBackgroundColor:[UIColor redColor]];
        return cell;
    }
    [cell setBackgroundColor:[UIColor blueColor]];
    
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
