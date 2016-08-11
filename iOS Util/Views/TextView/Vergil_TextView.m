//
//  VergilTextView.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "Vergil_TextView.h"

@interface Vergil_TextView ()
@property(nonatomic, strong) UILabel *placeHolderLbl;

@end

@implementation Vergil_TextView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    self.delegate = self;
    [self setUpPlaceHolderLbl];
  }

  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setUpPlaceHolderLbl];
  }

  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  UIEdgeInsets insets = self.textContainerInset;
  [_placeHolderLbl setFrame:CGRectMake(insets.left + 5, insets.top,
                                       self.bounds.size.width -
                                           (insets.left + insets.right + 10),
                                       CGRectGetHeight(_placeHolderLbl.frame))];
}

#pragma mark--Custom Method
- (void)setUpPlaceHolderLbl {
  UIEdgeInsets insets = self.textContainerInset;

  if (_placeHolderLbl == nil) {
    _placeHolderLbl = [[UILabel alloc] init];
    _placeHolderLbl.font = self.font;
    _placeHolderLbl.backgroundColor = [UIColor clearColor];
    _placeHolderLbl.textColor = [UIColor lightGrayColor];
    [self addSubview:_placeHolderLbl];
  }
  _placeHolderLbl.text = @"初始化必须需要文字来获取大小";
  [_placeHolderLbl sizeToFit];
  [_placeHolderLbl setFrame:CGRectMake(insets.left + 5, insets.top,
                                       self.bounds.size.width -
                                           (insets.left + insets.right + 10),
                                       CGRectGetHeight(_placeHolderLbl.frame))];
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(textChange:)
             name:UITextViewTextDidChangeNotification
           object:self];
}

- (void)setPlaceHolder:(NSString *)placeHolder {

  _placeHolderLbl.text = placeHolder;
}
#pragma mark--Custom Method
- (void)textChange:(NSNotificationCenter *)notification {
  if (!_wordsLength && _wordsLength == 0) {
    _wordsLength = 10;
    NSLog(@"长度没设置，默认10");
  }

  _placeHolderLbl.hidden = [self hasText];
  NSString *toBeString = self.text;
  NSString *lang = [[self textInputMode] primaryLanguage]; // 键盘输入模式
  if ([lang isEqualToString:
                @"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
    UITextRange *selectedRange = [self markedTextRange]; //获取高亮部分
    UITextPosition *position =
        [self positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
      if (toBeString.length == _wordsLength) {
        self.text = [toBeString substringToIndex:_wordsLength];
      }
    } // 有高亮选择的字符串，则暂不对文字进行统计和限制
    else {
    }
  } // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
  else {
    if (toBeString.length >= _wordsLength) {
      self.text = [toBeString substringToIndex:_wordsLength];
    }
  }
}

- (void)textViewDidChange:(UITextView *)textView {
  if (!_wordsLength && _wordsLength == 0) {
    _wordsLength = 10;
    NSLog(@"长度没设置，默认10");
  }
  if (self.text.length >= _wordsLength) {
    self.text = [self.text substringToIndex:_wordsLength];
  }
}

@end
