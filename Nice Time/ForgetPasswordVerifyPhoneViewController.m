//
//  ForgetPasswordVerifyPhoneViewController.m
//  Nice Time
//
//  Created by 王宗成 on 16/1/20.
//  Copyright © 2016年 杭州信使网络科技. All rights reserved.
//

#import "ForgetPasswordVerifyPhoneViewController.h"
#import "ForgetPasswordResetPasswordViewController.h"
@interface ForgetPasswordVerifyPhoneViewController ()
{
    UIButton *verifyPhoneButton;
    UIButton *fetchVerifyCodeButton;
    UITextField *phoneNumberField;
    UITextField *verifyCodeField;
    UIImageView *imageView;
}
@end

@implementation ForgetPasswordVerifyPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initNav];
    [self creatView];
}

-(void)initNav
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lable.textColor = [UIColor whiteColor];
    lable.adjustsFontSizeToFitWidth = YES;
    lable.font = [UIFont systemFontOfSize:23];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = @"手机验证";
    self.navigationItem.titleView = lable;
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)creatView
{
//    CGFloat rate = (CGFloat)235.0/134;// :W/H
    imageView= [[UIImageView alloc]initWithFrame:CGRectMake(60,120,kScreenWidth- 120,40)];
    imageView.image = [UIImage imageNamed:@"sfyz.png"];
    [self.view addSubview:imageView];
    
    phoneNumberField= [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(imageView.frame) + 40+10, kScreenWidth - 60, 38)];
    phoneNumberField.keyboardType = UIKeyboardTypeNamePhonePad;
    phoneNumberField.layer.cornerRadius = 5;
    phoneNumberField.layer.borderWidth = .5;
    phoneNumberField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    phoneNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneNumberField.placeholder = @" 请输入您的手机号码:";
    phoneNumberField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:phoneNumberField];

    fetchVerifyCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fetchVerifyCodeButton.frame = CGRectMake(kScreenWidth-30-90, CGRectGetMaxY(phoneNumberField.frame)+30, 90, 40);
    fetchVerifyCodeButton.layer.cornerRadius = 10;
    [fetchVerifyCodeButton setBackgroundColor:[UIColor orangeColor]];
    fetchVerifyCodeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [fetchVerifyCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fetchVerifyCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [fetchVerifyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [fetchVerifyCodeButton addTarget:self action:@selector(fetchVerifyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fetchVerifyCodeButton];
    
    verifyCodeField = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(phoneNumberField.frame) + 35, CGRectGetMinX(fetchVerifyCodeButton.frame) - 30 - 40, 30)];
    verifyCodeField.layer.borderWidth = .5;
    verifyCodeField.keyboardType = UIKeyboardTypeNumberPad;
    verifyCodeField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    verifyCodeField.placeholder = @"验证码";
    verifyCodeField.textAlignment = NSTextAlignmentCenter;
    verifyCodeField.layer.cornerRadius = 10;
    [self.view addSubview:verifyCodeField];
    
    verifyPhoneButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyPhoneButton.frame = CGRectMake(40, CGRectGetMaxY(fetchVerifyCodeButton.frame)+150, kScreenWidth - 40*2, 40);
    
    [verifyPhoneButton setBackgroundColor:[UIColor colorWithRed:36.0/255 green:175.0/255 blue:19.0/255 alpha:1]];
    
    verifyPhoneButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    verifyPhoneButton.layer.cornerRadius = 10;
    verifyPhoneButton.layer.borderWidth = .2;
    [verifyPhoneButton setTitle:@"验证手机" forState:UIControlStateNormal];
    [verifyPhoneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [verifyPhoneButton addTarget:self action:@selector(verifyButtonAction) forControlEvents:UIControlEventTouchUpInside];
   
    [self.view addSubview:verifyPhoneButton];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]init];
    buttonItem.title = @"返回";
    buttonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = buttonItem;
}

//验证手机
-(void)verifyButtonAction
{
    //手机验证成功之后进行模态视图跳转
    
}


//获取验证码
-(void)fetchVerifyButtonAction
{
    //在此需要进行安全检测
    [AVUser requestPasswordResetWithPhoneNumber:phoneNumberField.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
//            ForgetPasswordResetPasswordViewController *vc = [[ForgetPasswordResetPasswordViewController alloc]init];
//            [self presentViewController:vc animated:YES completion:nil];
        } else {
            //提示获取失败
        }
    }];
}

//隐藏键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
