//
//  RegisterViewController.h
//  ShengTaiShuiChengForIphone
//
//  Created by Apple on 2017/2/21.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginInputView.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate>{
@private
    int _watingTime;
}

@property(nonatomic)LoginInputView *mobileView;
@property(nonatomic)LoginInputView *passwordView;
@property(nonatomic,retain)UIButton *registerButton;
@property(nonatomic,retain)UITextField *seccodeField;
@property(nonatomic,retain)UIButton *seccodeButton;

@end
