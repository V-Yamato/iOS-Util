//
//  SildeNavViewController.m
//  iOS Util
//
//  Created by 黄聪 on 16/8/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "SildeNavViewController.h"
#import "FirstViewCtrl.h"
#import "SecViewCtrl.h"
#import "ThirViewCtrl.h"

@interface SildeNavViewController ()<UIScrollViewDelegate> {
    NSArray *titleArray;


}
@property (weak, nonatomic) IBOutlet UIScrollView *navScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation SildeNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setUpSubViews];
    
}






#pragma mark --initData subViews
- (void)initData {
    titleArray = @[@"动态",@"广场",@"话题",@"圈子"];
    
    UIStoryboard *sliderSB = [UIStoryboard storyboardWithName:@"SLiderView" bundle:nil];
    FirstViewCtrl *firView = [sliderSB instantiateViewControllerWithIdentifier:@"first"];
    firView.title = @"动态";
    [self addChildViewController:firView];
    
    SecViewCtrl *secView = [sliderSB instantiateViewControllerWithIdentifier:@"second"];
    secView.title = @"广场";
    [self addChildViewController:secView];
    
    ThirViewCtrl *thiView = [sliderSB instantiateViewControllerWithIdentifier:@"third"];
    thiView.title = @"话题";
    [self addChildViewController:thiView];
    

    
    for (int i = 0; i < 3; i++) {
        CGFloat lblW = 70;
        CGFloat lblH = 40;
        CGFloat lblY = 0;
        CGFloat lblX = i * lblW;
        UILabel *lbl1 = [[UILabel alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont fontWithName:@"HYQiHei" size:19];
        [_navScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
//        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    _navScrollView.contentSize = CGSizeMake(70 * 3, 0);
}

- (void)setUpSubViews {
    _contentScrollView.delegate = self;
    
    
    CGFloat contentSize = self.childViewControllers.count*[UIScreen mainScreen].bounds.size.width;
    _contentScrollView.contentSize = CGSizeMake(contentSize, 0);
    _contentScrollView.pagingEnabled = YES;
    
    FirstViewCtrl *firView = [self.childViewControllers firstObject];
    [firView.view setFrame:_contentScrollView.bounds];
    [_contentScrollView addSubview:firView.view];
}



#pragma mark --ScrollView Delegates

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x / _contentScrollView.frame.size.width;
    
    if (index==0) {
        FirstViewCtrl *viewCtrl = self.childViewControllers[index];
        if ([viewCtrl.view superview]) return;
        viewCtrl.view.frame = _contentScrollView.bounds;
        [_contentScrollView addSubview:viewCtrl.view];
    }else if (index == 1) {
        SecViewCtrl *viewCtrl = self.childViewControllers[index];
        if ([viewCtrl.view superview]) return;
        viewCtrl.view.frame = _contentScrollView.bounds;
        [_contentScrollView addSubview:viewCtrl.view];
    }else if (index == 2) {
        ThirViewCtrl *viewCtrl = self.childViewControllers[index];
        if ([viewCtrl.view superview]) return;
        viewCtrl.view.frame = _contentScrollView.bounds;
        [_contentScrollView addSubview:viewCtrl.view];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}





@end
