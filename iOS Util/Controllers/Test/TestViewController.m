//
//  TestViewController.m
//  iOS Util
//
//  Created by 黄聪 on 16/7/11.
//  Copyright © 2016年 黄聪. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _vergilTextView.delegate=self;
    _testTextView.placeholder=@"haha";
    _vergilTextView.placeHolder=@"vergil";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textViewDidChange:(UITextView *)textView{
    _vergilTextView.backgroundColor=[UIColor redColor];

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
