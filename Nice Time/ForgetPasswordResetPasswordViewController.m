//
//  ForgetPasswordResetPasswordViewController.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/20.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "ForgetPasswordResetPasswordViewController.h"

@interface ForgetPasswordResetPasswordViewController ()

@end

@implementation ForgetPasswordResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNav];
}

-(void)initNav
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lable.textColor = [UIColor whiteColor];
    lable.adjustsFontSizeToFitWidth = YES;
    lable.font = [UIFont systemFontOfSize:23];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = @"密码重置";
    self.navigationItem.titleView = lable;
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
