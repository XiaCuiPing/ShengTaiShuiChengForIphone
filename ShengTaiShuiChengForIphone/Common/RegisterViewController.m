//
//  RegisterViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize mobileView   = _mobileView;
@synthesize passwordView = _passwordView;
@synthesize registerButton = _registerButton;
@synthesize seccodeField   = _seccodeField;
@synthesize seccodeButton  = _seccodeButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor bgColor]];
    [self setTitle:@"手机注册"];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"0xf2f2f2"]];
    
    self.navigationItem.leftBarButtonItem = [DSXUI barButtonWithStyle:DSXBarButtonStyleBack target:self action:@selector(back)];
    
    //用户名
    _mobileView = [[LoginInputView alloc] initWithFrame:CGRectMake(0, 10, SWIDTH, 40)];
    _mobileView.leftImage = @"icon-user.png";
    _mobileView.placeHolder = @"请输入手机号/邮箱账号";
    _mobileView.textField.delegate = self;
    [self.view addSubview:_mobileView];
    
    //密码输入框
    _passwordView = [[LoginInputView alloc] initWithFrame:CGRectMake(0, 52, SWIDTH, 40)];
    _passwordView.leftImage = @"icon-password.png";
    _passwordView.placeHolder = @"请输入密码:";
    _passwordView.textField.secureTextEntry = YES;
    _passwordView.textField.delegate = self;
    [self.view addSubview:_passwordView];
    
    //短信验证码
    UIView *secView = [[UIView alloc] initWithFrame:CGRectMake(0, 95, SWIDTH, 40)];
    secView.backgroundColor = [UIColor whiteColor];
    
    _seccodeField = [[UITextField alloc] initWithFrame:CGRectMake(110, 0, 120, 40)];
    _seccodeField.placeholder = @"请输入验证码";
    _seccodeField.returnKeyType = UIReturnKeyDone;
    _seccodeField.delegate = self;
    _seccodeField.keyboardType = UIKeyboardTypeNumberPad;
    [secView addSubview:_seccodeField];
    
    //发送验证码按钮
    _seccodeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [_seccodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_seccodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_seccodeButton setBackgroundImage:[UIImage imageNamed:@"icon-yanzhengma.png"] forState:UIControlStateNormal];
    [_seccodeButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [_seccodeButton addTarget:self action:@selector(sendSecCode) forControlEvents:UIControlEventTouchUpInside];
    [secView addSubview:_seccodeButton];
    
    [self.view addSubview:secView];
    
    _registerButton = [[UIButton alloc] init];
    _registerButton.frame = CGRectMake(10, 200, SWIDTH-20, 40);
    _registerButton.titleLabel.text = @"注册";
    [_registerButton setTitleColor:[UIColor colorWithHexString:@"0X4E5558"] forState:UIControlStateNormal];
    _registerButton.layer.cornerRadius = 20.0;
    [_registerButton addTarget:self action:@selector(checkRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendSecCode
{

}

- (void)checkRegister
{

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}


@end
