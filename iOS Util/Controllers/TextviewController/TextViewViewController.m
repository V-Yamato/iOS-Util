//
//  TextViewViewController.m
//  iOS Util
//
//  Created by 黄聪 on 16/8/10.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "TextViewViewController.h"
#import "VergilTextView.h"

@interface TextViewViewController ()
@property (weak, nonatomic) IBOutlet VergilTextView *textView;

@end

@implementation TextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.placeHolder=@"我是placeholder！！";
    _textView.placeHolderColor=[UIColor colorWithHex:0x48BBC7];
    _textView.wordsLength=20;
//    textview光标从头开始SB里面直接勾选
//    self.automaticallyAdjustsScrollViewInsets=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
