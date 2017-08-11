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
 Validate user identifier no. (e.g. 41156719970703051X)
 
 @return result.
 */
- (BOOL)validateIdentityCard;

/**
 Validate bank card no.
 
 @return result.
 */
- (BOOL)validateBankCardNumber;

/**
 Validate mobile phone.
 
 @return value.
 */
- (BOOL)validateMobilePhone;

/**
 Validate pwd contains(字母、符号、数字).
 
 @return value.
 */
- (BOOL)validatePwd;

/**
 Validate email.
 
 @return value.
 */
- (BOOL)validateEmail;



@end
