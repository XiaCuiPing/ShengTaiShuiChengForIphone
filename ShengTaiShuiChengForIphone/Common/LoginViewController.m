//
//  LoginViewController.m
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameView = _usernameView;
@synthesize passwordView = _passwordView;
@synthesize loginButton  = _loginButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"0xf2f2f2"]];
    [self setTitle:@"登录"];
    
    self.navigationItem.leftBarButtonItem = [DSXUI barButtonWithStyle:DSXBarButtonStyleBack target:self action:@selector(closeLogin)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(showRegister)];
    
    //用户名输入框
    _usernameView = [[LoginInputView alloc] initWithFrame:CGRectMake(0, 10, SWIDTH, 40)];
    _usernameView.leftImage = @"icon-user.png";
    _usernameView.placeHolder = @"请输入手机号/邮箱账号";
    _usernameView.textField.delegate = self;
    [self.view addSubview:_usernameView];
    
    //密码输入框
    _passwordView = [[LoginInputView alloc] initWithFrame:CGRectMake(0, 52, SWIDTH, 40)];
    _passwordView.leftImage = @"icon-password.png";
    _passwordView.placeHolder = @"请输入密码";
    _passwordView.textField.secureTextEntry = YES;
    [self.view addSubview:_passwordView];
    
    _loginButton = [[UIButton alloc] init];
    _loginButton.frame = CGRectMake(10, 160, SWIDTH-20, 40);
    _loginButton.titleLabel.text = @"登录";
    _loginButton.layer.cornerRadius = 20.0;
    [_loginButton setTitleColor:[UIColor colorWithHexString:@"0X4E5558"] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    NSDictionary *loginInfo = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"loginInfo"];
    if (loginInfo) {
        _usernameView.text = [loginInfo objectForKey:@"account"];
        _passwordView.text = [loginInfo objectForKey:@"password"];
    }
    
    //找回密码
    UIButton *findPAssword = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 30)];
    [findPAssword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [findPAssword setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] forState:UIControlStateNormal];
    [findPAssword.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [findPAssword addTarget:self action:@selector(findPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findPAssword];
    
    
}

- (void)closeLogin{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showRegister
{

}

- (void)findPassword:(UIButton *)button
{

}

-(void)login
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
