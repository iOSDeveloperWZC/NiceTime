//
//  RegisViewController.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/16.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "RegisViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface RegisViewController ()
{
    UIImageView *LogoImageView;
    UITextField *accountField;
    UITextField *passwordField;
    UITextField *verifyCodeField;
    UIButton *fetchVerifyCodeButton;
    UIButton *loginButton;
}
@end

@implementation RegisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubView];
}

-(void)setUpSubView
{
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat rate = (CGFloat)235.0/134;// :W/H
    LogoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, kScreenWidth - 120 ,(kScreenWidth - 120)/rate)];
    //    LogoImageView.backgroundColor = [UIColor redColor];
    LogoImageView.image = [UIImage imageNamed:@"Logo.png"];
    [self.view addSubview:LogoImageView];
    
    accountField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(LogoImageView.frame) + 40+10, kScreenWidth - 60, 38)];
    accountField.keyboardType = UIKeyboardTypeNamePhonePad;
    accountField.layer.cornerRadius = 5;
    accountField.layer.borderWidth = .5;
    accountField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    accountField.placeholder = @" 请输入您的手机号码:";
    accountField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:accountField];
    
    
    passwordField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(accountField.frame) + 20, kScreenWidth - 30*2, 38)];
    passwordField.keyboardType = UIKeyboardTypeNamePhonePad;
    passwordField.layer.cornerRadius = 5;
    passwordField.layer.borderWidth = .5;
    passwordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.placeholder = @" 请设置您的登录密码:";
    passwordField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:passwordField];
    
    fetchVerifyCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fetchVerifyCodeButton.frame = CGRectMake(kScreenWidth-30-90, CGRectGetMaxY(passwordField.frame)+20, 90, 40);
    fetchVerifyCodeButton.layer.cornerRadius = 10;
    [fetchVerifyCodeButton setBackgroundColor:[UIColor orangeColor]];
    fetchVerifyCodeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [fetchVerifyCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fetchVerifyCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [fetchVerifyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [fetchVerifyCodeButton addTarget:self action:@selector(fetchVerifyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fetchVerifyCodeButton];
    
    verifyCodeField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(passwordField.frame) + 20, CGRectGetMinX(fetchVerifyCodeButton.frame) - 30 - 40, 40)];
    verifyCodeField.layer.borderWidth = .5;
    verifyCodeField.keyboardType = UIKeyboardTypeNumberPad;
    verifyCodeField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    verifyCodeField.placeholder = @"验证码";
    verifyCodeField.textAlignment = NSTextAlignmentCenter;
    verifyCodeField.layer.cornerRadius = 10;
    [self.view addSubview:verifyCodeField];
    
    loginButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(40, CGRectGetMaxY(fetchVerifyCodeButton.frame)+40, kScreenWidth - 40*2, 40);
    [loginButton setBackgroundColor:[UIColor colorWithRed:36.0/255 green:175.0/255 blue:19.0/255 alpha:1]];
    
    loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loginButton.layer.cornerRadius = 10;
    loginButton.layer.borderWidth = .2;
    [loginButton setTitle:@"注 册" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [loginButton addTarget:self action:@selector(RegisButtonAction) forControlEvents:UIControlEventTouchUpInside];
    loginButton.enabled = NO;
    [self.view addSubview:loginButton];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)fetchVerifyButtonAction
{
    
}

-(void)RegisButtonAction
{
    if ([loginButton.titleLabel.text isEqualToString:@"立即登陆"]) {
        NSLog(@"立即登陆");
    }
    else
    {
        AVUser *user = [AVUser user];
        user.username = accountField.text;
        user.password =  passwordField.text;
        user.mobilePhoneNumber = accountField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                
                [loginButton setTitle:@"立即登陆" forState:UIControlStateNormal];
                
            } else {
                
                NSLog(@"error ：%@",error);
            }
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
