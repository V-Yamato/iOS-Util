//
//  VergilTextView.h
//  iOS Util
//
//  Created by 黄聪 on 16/7/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Vergil_TextView : UITextView<UITextViewDelegate>

@property (nonatomic,strong)NSString *placeHolder;
@property (nonatomic,strong)UIColor *placeHolderColor;
@property (nonatomic,assign)NSInteger wordsLength;

@end
