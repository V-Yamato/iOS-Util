//
//  InfiniteScrollViewCtrl.m
//  iOS Util
//
//  Created by 左文涛 on 16/9/30.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "InfiniteScrollViewCtrl.h"
#import "InfiniteScrollCollectView.h"
#import "InfiniteScrollView.h"

@interface InfiniteScrollViewCtrl ()
@property (weak, nonatomic) IBOutlet InfiniteScrollCollectView *infiniteScroll;

@end

@implementation InfiniteScrollViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    InfiniteScrollView *view = [[InfiniteScrollView alloc]init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
