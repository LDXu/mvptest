//
//  LoginView.h
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LoginView : UIView
@property (nonatomic, copy) void (^loginBlock)(NSString *account, NSString *pwd);
@end
