//
//  NSString+Validate.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

- (BOOL)validateIdentityCard {
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)validateBankCardNumber {
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:self];
}


- (BOOL)validateMobilePhone {
    NSString *phoneNumberRegexCN = @"(\\+86)*(([0-9])|(\\-)|(\\s))*";
    NSString *phoneNumberRegixSimple = @"^1[3-8]\\d{9}";
    NSPredicate *predCN = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneNumberRegexCN];
    NSString *phoneNumber = self;
    if ([predCN evaluateWithObject:phoneNumber]) {
        if ([phoneNumber hasPrefix:@"+86"]) {
            phoneNumber = [phoneNumber substringFromIndex:3];
        }
        NSString *string = [[phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        phoneNumber = string;
        NSPredicate *predSimple = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneNumberRegixSimple];
        if (![predSimple evaluateWithObject:phoneNumber]) {
            return NO;
        }
        return YES;
    }
    return NO;
}

- (BOOL)validatePwd {
    NSString *passwordRegex = @"^(?![A-Z]+$)(?![a-z]+$)(?!\\d+$)(?![\\W_]+$)\\S{6,20}$"/*@"^[A-Za-z0-9]{6,20}+$"*/;
    return [self isValidateByRegex:passwordRegex];
}

- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end
