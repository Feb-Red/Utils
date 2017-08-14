//
//  ExceptionHandler.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExceptionHandler : NSObject

@property (nonatomic, assign) BOOL supportWriteFile;

+ (instancetype)defaultHandler;

void uncaughtExceptionHandler(NSException *exception);

+ (void)InstallUncaughtExceptionHandler;

+ (BOOL)hasCrashInfo;

+ (NSString *)getCrachInfo;

+ (BOOL)removeCrashInfo;

@end
