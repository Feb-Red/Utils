//
//  TouchIDHelp.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/10/23.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 指纹验证状态
 
 - VerifySuccess: 验证成功
 - InputPassword: 输入登录密码
 - UserCancel: 用户取消验证
 - VerifyFailed: 验证失败
 - NotFoundTouchID: 没有发现TouchID
 - SystemCancel: 系统被挂起，验证取消
 - ForceLogout: 密码被锁
 */
typedef NS_ENUM(NSUInteger, TouchStatus) {
    VerifySuccess               = 0,
    InputPassword               = 1,
    UserCancel                  = 2,
    VerifyFailed                = 3,
    NotFoundTouchID             = 4,
    SystemCancel                = 5,
    ForceLogout                 = 6
};

@interface TouchIDHelp : NSObject

/**
 this device support touch id

 @return value
 */
+ (BOOL)supportTouchID;

/**
 set message when show TouchID

 @param message message
 */
+ (void)setTouchIDMessage:(NSString *)message;

/**
 set support password verify (iOS 9.0 +)

 @param support suppoort
 */
+ (void)setSupportPasswordHandler:(BOOL)support;

/**
 set fallback title

 @param fallbackTitle fallback title
 */
+ (void)setFallbackTitle:(NSString *)fallbackTitle;

/**
 verify touch id

 @param resultCallback callback
 */
+ (void)verifyTouchID:(void (^)(TouchStatus))resultCallback;

@end
