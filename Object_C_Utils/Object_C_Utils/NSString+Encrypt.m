//
//  NSString+Encrypt.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "NSString+Encrypt.h"
#include <sys/types.h>
#include <sys/sysctl.h>
//MD5加密
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encrypt)

- (NSString *)MD5 {
    if (self.length == 0) {
        return nil;
    }
    const char *fooData = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);
    NSMutableString *saveResult = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    return saveResult;
}

@end
