//
//  LoginView.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)login:(id)sender {
    
    if (!_account.hasText||!_pwd.hasText) {
        NSLog(@"弹出提示没有填写");
        return;
    }
    if (self.loginBlock) {
        _loginBlock(_account.text, _pwd.text);
    }
    
}

@end
