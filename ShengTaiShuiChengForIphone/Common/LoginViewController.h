//
//  LoginViewController.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginInputView.h"
#import "RegisterViewController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,retain)LoginInputView *usernameView;
@property(nonatomic,retain)LoginInputView *passwordView;
@property(nonatomic,retain)UIButton *loginButton;

@end
