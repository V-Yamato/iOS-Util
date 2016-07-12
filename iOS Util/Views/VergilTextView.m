//
//  VergilTextView.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "VergilTextView.h"

@interface VergilTextView ()
@property(nonatomic, strong) UILabel *placeHolderLbl;

@end

@implementation VergilTextView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
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
           object:nil];
}

- (void)setPlaceHolder:(NSString *)placeHolder {

  _placeHolderLbl.text = placeHolder;
}
#pragma mark--Custom Method
- (void)textChange:(NSNotificationCenter *)notification {
  _placeHolderLbl.hidden = [self hasText];
}

@end
