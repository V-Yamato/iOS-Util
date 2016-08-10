//
//  Vergil_WKWebView.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/19.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "Vergil_WKWebView.h"

@implementation Vergil_WKWebView{
    UILabel *loadingLbl;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.navigationDelegate=self;
//        [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
        [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com/"]]];
    }
    return self;
}


#pragma mark --Delegates

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    loadingLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    loadingLbl.text=@"正在加载";
    [self addSubview:loadingLbl];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [loadingLbl removeFromSuperview];

}


@end
