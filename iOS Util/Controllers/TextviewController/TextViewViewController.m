//
//  TextViewViewController.m
//  iOS Util
//
//  Created by 黄聪 on 16/8/10.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "TextViewViewController.h"
#import "Vergil_TextView.h"

@interface TextViewViewController ()
@property (weak, nonatomic) IBOutlet Vergil_TextView *textView;

@end

@implementation TextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.placeHolder=@"我是placeholder！！";
    _textView.placeHolderColor=[UIColor colorWithHex:0x48BBC7];
    _textView.wordsLength=20;
//    textview光标从头开始SB里面直接勾选
//    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    double f = 999999.999999;
//    NSString *str =  [self notRounding:f afterPoint:1];
//    NSInteger a = f*100;
//    float b = a/100.0;
//    NSLog(@"%@",str);
//    NSLog(@"%01f",b);
    double c =floor(f*10)/10;
    
    NSLog(@"%.1f",c);
    
    NSString *str1 =  [NSString stringWithFormat:@"%01f",f];
    NSLog(@"%@",str1);
    
}


-(NSString *)notRounding:(float)price afterPoint:(int)position{
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal;
    
    NSDecimalNumber *roundedOunces;
    
    
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return [NSString stringWithFormat:@"%@",roundedOunces];
    
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
