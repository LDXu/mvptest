//
//  LoginVC.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "LoginModel.h"
#import "LoginPresenter.h"
@interface LoginVC ()<LoginProtocol>
{
    LoginModel *Lmodel;
}
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) LoginPresenter *loginPresenter;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLoginModel];
    [self initLoginView];
    
    [self.loginPresenter xw_addObserverBlockForKeyPath:@"isLogined" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
        NSLog(@"111%@",newVal);
        if ([newVal boolValue]) {
            NSLog(@"%@",@"11111111");
        }else{
            NSLog(@"%@",@"2222222");
        }
    }];

}

- (void)initLoginModel{

    Lmodel = [LoginModel shareInstance];
    
}

- (void)initLoginView{

    [self.view addSubview:self.loginView];

}

- (LoginPresenter *)loginPresenter{
    if (!_loginPresenter) {
        _loginPresenter = [[LoginPresenter alloc] init];
        [_loginPresenter attachView:self];
    }
    return _loginPresenter;
}

- (void)loginState:(BOOL)isLogined{

    if (isLogined) {
        NSLog(@"代理Y");
        return;
    }
    NSLog(@"代理N");
    
}

- (LoginView*)loginView{

    if (!_loginView) {
        LoginView *loginV = [[[NSBundle mainBundle]loadNibNamed:@"LoginView" owner:nil options:nil]objectAtIndex:0];
        loginV.frame = CGRectMake(0, 0, 600, 400);
        loginV.center = self.view.center;
        _loginView = loginV;
        kWeakSelf(self);
        _loginView.loginBlock = ^(NSString *account,NSString *pwd){
           [weakself.loginPresenter loginStateWithAccount:account pwd:pwd success:^{
               NSLog(@"block Y");
           } faile:^{
               NSLog(@"block N");
           }];
        };

    }
    return _loginView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
