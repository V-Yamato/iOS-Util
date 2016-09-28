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
#import "SlideLabel.h"

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
        SlideLabel *lbl1 = [[SlideLabel alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont fontWithName:@"HYQiHei" size:19];
        [_navScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    _navScrollView.contentSize = CGSizeMake(70 * 3, 0);
}

- (void)setUpSubViews {
    _contentScrollView.delegate = self;
    
    _navScrollView.showsHorizontalScrollIndicator=NO;
    _navScrollView.showsVerticalScrollIndicator=NO;
    
    CGFloat contentSize = self.childViewControllers.count*[UIScreen mainScreen].bounds.size.width;
    _contentScrollView.contentSize = CGSizeMake(contentSize, 0);
    _contentScrollView.pagingEnabled = YES;
    
    FirstViewCtrl *firView = [self.childViewControllers firstObject];
    [firView.view setFrame:_contentScrollView.bounds];
    
    SlideLabel *lable = [_navScrollView.subviews firstObject];
    lable.scale = 1.0;
    
    [_contentScrollView addSubview:firView.view];
}


#pragma mark --Actions
/** 标题栏label的点击事件 */
- (void)lblClick:(UITapGestureRecognizer *)recognizer
{
    SlideLabel *titlelable = (SlideLabel *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * _contentScrollView.frame.size.width;
    
    CGFloat offsetY = _contentScrollView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    
    [_contentScrollView setContentOffset:offset animated:YES];
    
//    [self setScrollToTopWithTableViewIndex:titlelable.tag];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    SlideLabel *labelLeft = _navScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < _navScrollView.subviews.count) {
        SlideLabel *labelRight = _navScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
    
}



@end
