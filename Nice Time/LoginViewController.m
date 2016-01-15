//
//  LoginViewController.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/14.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    UIImageView *BGImageView;
    UIImageView *LogoImageView;
    UITextField *accountField;
    UITextField *passwordField;
    UIButton *loginButton;
    UIView *leftLineView;
    UIView *rightLineView;
    UILabel *otherAccountLable;
    UIButton *qqButton;
    UIButton *weiboButton;
    UIButton *doubanButton;
    UIButton *forgetPasswordButton;
    UIButton *registButton;
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self creatSubView];
}

-(void)creatSubView
{
    
    self.view.backgroundColor = [UIColor whiteColor];
//    BGImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    BGImageView.image = [UIImage imageNamed:@"a.png"];
//    
   // [self.view addSubview:BGImageView];
    CGFloat rate = (CGFloat)235.0/134;// :W/H
    LogoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 50, kScreenWidth - 120 ,(kScreenWidth - 120)/rate)];
//    LogoImageView.backgroundColor = [UIColor redColor];
    LogoImageView.image = [UIImage imageNamed:@"Logo.png"];
    [self.view addSubview:LogoImageView];
    
    accountField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(LogoImageView.frame) + 40+10, kScreenWidth - 60, 38)];
    accountField.keyboardType = UIKeyboardTypeNamePhonePad;
    accountField.layer.cornerRadius = 5;
    accountField.layer.borderWidth = 1;
    accountField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    accountField.placeholder = @" 账号:";
    [self.view addSubview:accountField];
    
 
    passwordField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(accountField.frame) + 20, kScreenWidth - 30*2, 38)];
    passwordField.keyboardType = UIKeyboardTypeNamePhonePad;
    passwordField.layer.cornerRadius = 5;
    passwordField.layer.borderWidth = 1;
    passwordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.placeholder = @" 密码:";
    [self.view addSubview:passwordField];
    
    loginButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(40, CGRectGetMaxY(passwordField.frame)+40, kScreenWidth - 40*2, 40);
    [loginButton setBackgroundColor:[UIColor colorWithRed:36.0/255 green:175.0/255 blue:19.0/255 alpha:1]];
    
    loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loginButton.layer.cornerRadius = 10;
    loginButton.layer.borderWidth = .2;
    [loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //25 100
    
    leftLineView = [[UIView alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(loginButton.frame) + 40, (kScreenWidth - 25*2 - 100)/2, 1)];
    leftLineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:leftLineView];
    
    otherAccountLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftLineView.frame), CGRectGetMaxY(loginButton.frame)+40, 100, 21)];
    otherAccountLable.font = [UIFont systemFontOfSize:14];
    otherAccountLable.textAlignment = NSTextAlignmentCenter;
    otherAccountLable.text = @"其他账号登录";
    [self.view addSubview:otherAccountLable];
    
    rightLineView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(otherAccountLable.frame), CGRectGetMaxY(loginButton.frame) + 40, (kScreenWidth - 25*2 - 100)/2, 1)];
    rightLineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:rightLineView];
    
    qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
    qqButton.frame = CGRectMake((kScreenWidth - 2*15 - 50*3)/2, CGRectGetMaxY(otherAccountLable.frame) + 20, 50, 50);
    [qqButton setBackgroundImage:[UIImage imageNamed:@"sns_icon_QQ@2x.png"] forState:UIControlStateNormal];
    [self.view addSubview:qqButton];
    
    weiboButton = [UIButton buttonWithType:UIButtonTypeCustom];
    weiboButton.frame = CGRectMake(CGRectGetMaxX(qqButton.frame)+15, CGRectGetMaxY(otherAccountLable.frame)+20, 50, 50);
    [weiboButton setBackgroundImage:[UIImage imageNamed:@"sns_icon_WB@2x.png"] forState:UIControlStateNormal];
    [self.view addSubview:weiboButton];
    
    doubanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doubanButton.frame = CGRectMake(CGRectGetMaxX(weiboButton.frame)+15, CGRectGetMaxY(otherAccountLable.frame)+20, 50, 50);
    [doubanButton setBackgroundImage:[UIImage imageNamed:@"sns_icon_豆瓣@2x.png"] forState:UIControlStateNormal];
    [self.view addSubview:doubanButton];
    
    forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPasswordButton.frame = CGRectMake(30, kScreenHeight - 20 - 25, 80, 25);
    forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPasswordButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:forgetPasswordButton];
    
    registButton= [UIButton buttonWithType:UIButtonTypeCustom];
    registButton.frame = CGRectMake(kScreenWidth - 30 - 80, kScreenHeight - 20 - 25, 80, 25);
    registButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [registButton setTitle:@"我要注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:registButton];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)loginButtonAction
{
    NSLog(@"登录");
}

@end
