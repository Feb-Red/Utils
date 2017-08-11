//
//  NSString+Validate.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

/**
 验证身份证号
 
 @return result
 */
- (BOOL)validateIdentityCard;

/**
 验证银行卡卡号
 
 @return result
 */
- (BOOL)validateBankCardNumber;

/**
 是否为手机号
 
 @return value
 */
- (BOOL)validateMobilePhone;

/**
 密码是否有效(字母、符号、数字)
 
 @return value
 */
- (BOOL)validatePwd;

/**
 邮箱的合法性
 
 @return value
 */
- (BOOL)validateEmail;



@end
