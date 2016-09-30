//
//  InfiniteScrollViewCtrl.m
//  iOS Util
//
//  Created by 左文涛 on 16/9/30.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "InfiniteScrollViewCtrl.h"

@interface InfiniteScrollViewCtrl ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *scrollCollectView;

@end

@implementation InfiniteScrollViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [_scrollCollectView setDelegate:self];
    [_scrollCollectView setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
