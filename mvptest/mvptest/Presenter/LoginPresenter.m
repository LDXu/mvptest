//
//  LoginPresenter.m
//  mvptest
//
//  Created by XuBill on 2016/12/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginPresenter.h"
#import "LoginModel.h"

@interface LoginPresenter ()
@property (nonatomic, strong) LoginModel* model;
@property (nonatomic,weak) id<LoginProtocol> attachView;
@property (nonatomic, assign) BOOL isLogined;
@end

@implementation LoginPresenter

-(void)attachView:(id <LoginProtocol>)view{
    
    self.attachView = view;
    _model = [LoginModel shareInstance];
    
}


- (void)loginStateWithAccount:(NSString*)account pwd:(NSString*)pwd success:(void(^)())LoginSuccess faile:(void(^)())faile{
    
    _model.account = account;
    _model.pwd = pwd;
    [_model loginStateSuccess:^{
//        [_attachView loginState:YES];
//        LoginSuccess();
        self.isLogined = YES;
    } faile:^{
//        [_attachView loginState:NO];
//        faile();
        self.isLogined = NO;
    }];

}
@end
