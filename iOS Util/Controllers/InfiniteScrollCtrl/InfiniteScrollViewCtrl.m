//
//  InfiniteScrollViewCtrl.m
//  iOS Util
//
//  Created by 左文涛 on 16/9/30.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "InfiniteScrollViewCtrl.h"
#import "InfiniteScrollCollectView.h"

@interface InfiniteScrollViewCtrl ()
@property (weak, nonatomic) IBOutlet InfiniteScrollCollectView *infiniteScroll;

@end

@implementation InfiniteScrollViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
//    _infiniteScroll.contentOffset = CGPointMake(self.view.frame.size.width, 0);
//    NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
//    [_infiniteScroll scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
