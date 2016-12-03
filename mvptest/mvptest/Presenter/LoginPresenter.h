//
//  LoginPresenter.h
//  mvptest
//
//  Created by XuBill on 2016/12/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginProtocol.h"
@class LoginModel;
@interface LoginPresenter : NSObject
-(void)attachView:(id <LoginProtocol>)view;
- (void)loginStateWithAccount:(NSString*)account pwd:(NSString*)pwd success:(void(^)())LoginSuccess faile:(void(^)())faile;
@end
