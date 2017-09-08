//
//  UIApplication+Log.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/9/8.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "UIApplication+Log.h"

@implementation UIApplication (Log)

- (void)writeLogToFile:(nonnull NSString *)fileName {
    freopen([fileName fileSystemRepresentation], "w", stderr);
}

@end
