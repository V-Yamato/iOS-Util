//
//  WebViewController.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/19.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Vergil_WKWebView *webView = [[Vergil_WKWebView alloc]init];
    CGRect frame = self.view.frame;
    frame.origin.y=20;
    webView.frame=frame;
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
