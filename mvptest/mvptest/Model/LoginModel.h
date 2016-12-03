//
//  LoginModel.h
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, copy) NSString *account;
+ (instancetype)shareInstance;
- (void)loginStateSuccess:(void(^)())LoginSuccess faile:(void(^)())faile;
@end
