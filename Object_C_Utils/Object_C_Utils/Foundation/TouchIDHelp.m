//
//  TouchIDHelp.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/10/23.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "TouchIDHelp.h"
#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation TouchIDHelp


NSString *touchIDMessage;
BOOL supportPasswordVerify;
NSString *fallbackTitle;

+ (BOOL)supportTouchID {
    NSError *error = nil;
    LAPolicy policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    LAContext *context = [[LAContext alloc] init];
    BOOL result = [context canEvaluatePolicy:policy error:&error];
    if (!result || error) {
        return NO;
    }
    return YES;
}

+ (void)setTouchIDMessage:(NSString *)message {
    touchIDMessage = message;
}

+ (void)setSupportPasswordHandler:(BOOL)support {
    supportPasswordVerify = support;
}

+ (void)setFallbackTitle:(NSString *)fallbackTitle {
    fallbackTitle = fallbackTitle;
}

+ (void)verifyTouchID:(void (^)(TouchStatus))resultCallback {
    LAContext *context = [[LAContext alloc] init];
    if ([context respondsToSelector:@selector(setMaxBiometryFailures:)]) {
        context.maxBiometryFailures = @(3);
    }
    if ([context respondsToSelector:@selector(setLocalizedCancelTitle:)]) {
        context.localizedCancelTitle = NSLocalizedString(@"touchID_button_cancel", nil);
    }
    if (fallbackTitle) {
         context.localizedFallbackTitle = fallbackTitle;
    } else {
    context.localizedFallbackTitle = @"";
    }
    NSError *error;
    LAPolicy policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        if (supportPasswordVerify) {
            policy = LAPolicyDeviceOwnerAuthentication;
        }
    }
    
    if ([context canEvaluatePolicy:policy error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:touchIDMessage reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"touchID 验证成功");
                if (resultCallback) {
                    resultCallback(VerifySuccess);
                }
            } else {
                NSInteger code = error.code;
                switch (code) {
                    case kLAErrorAuthenticationFailed: {
                        NSLog(@"指纹验证失败");
                        if (resultCallback) {
                            resultCallback(VerifyFailed);
                        }
                    }
                        break;
                    case kLAErrorUserCancel: {
                        NSLog(@"用户点击取消");
                        if (resultCallback) {
                            resultCallback(UserCancel);
                        }
                    }
                        break;
                    case kLAErrorUserFallback: {
                        NSLog(@"认证被取消,用户点击回退按钮(输入密码)");
                        if (resultCallback) {
                            resultCallback(InputPassword);
                        }
                    }
                        break;
                    case kLAErrorSystemCancel: {
                        NSLog(@"身份验证被系统取消,(比如另一个应用程序去前台,切换到其他 APP)");
                        if (resultCallback) {
                            resultCallback(SystemCancel);
                        }
                    }
                        break;
                        
                    case kLAErrorTouchIDLockout: {
                        NSLog(@"多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁");
                        if (resultCallback) {
                            resultCallback(ForceLogout);
                        }
                    }
                        break;
                    case kLAErrorAppCancel: {
                        NSLog(@"用户不能控制的挂起，例如突然来了电话，电话应用进入前台，APP被挂起。");
                        if (resultCallback) {
                            resultCallback(SystemCancel);
                        }
                    }
                        break;
                    case kLAErrorInvalidContext: {
                        NSLog(@"授权过程中,LAContext对象被释放掉");
                        if (resultCallback) {
                            resultCallback(SystemCancel);
                        }
                    }
                        break;
                    default:
                        break;
                }
            }
        }];
    } else {
        if(error.code == LAErrorTouchIDNotEnrolled) {
            NSLog(@"身份验证无法启动,因为没有登记的手指触摸ID。 没有设置指纹密码时。");
        }else if(error.code == LAErrorTouchIDNotAvailable) {
            NSLog(@"身份验证无法启动,因为触摸ID在设备上不可用。");
            
        }else if(error.code == LAErrorPasscodeNotSet){
            NSLog(@"身份验证无法启动,因为密码在设备上没有设置");
        }
        if (resultCallback) {
            resultCallback(NotFoundTouchID);
        }
    }
}

@end
