//
//  Vergil_WKWebView.h
//  iOS Util
//
//  Created by 黄聪 on 16/7/19.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface Vergil_WKWebView : WKWebView<WKNavigationDelegate>

@property(nonatomic,copy)NSString *urlStr;

@end
