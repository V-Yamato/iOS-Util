//
//  TestViewController.h
//  iOS Util
//
//  Created by 黄聪 on 16/7/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "BaseViewController.h"
#import "VergilTextView.h"
#import "PlaceholderTextView.h"


@interface TestViewController : BaseViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet PlaceholderTextView *testTextView;
@property (weak, nonatomic) IBOutlet VergilTextView *vergilTextView;

@end
