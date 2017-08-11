//
//  ExceptionHandler.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "ExceptionHandler.h"

static NSString *const kExceptionInfoKey = @"exceptionInfo";

NSUncaughtExceptionHandler *handler = nil;

@interface ExceptionHandler()

@property (nonatomic, copy) NSString *filePath;

@end

@implementation ExceptionHandler

void uncaughtExceptionHandler(NSException *exception){
    NSArray *stackArray = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    [ExceptionHandler saveExceptionInfo:exceptionInfo];
    NSLog(@"%@", exceptionInfo);
}

+ (void)InstallUncaughtExceptionHandler {
    handler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
}

+ (instancetype)defaultHandler {
    static ExceptionHandler *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

+ (void)saveExceptionInfo:(NSString *)info {
    if ([ExceptionHandler defaultHandler].supportWriteFile) {
        [self writefile:info];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:info forKey:kExceptionInfoKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSString *)filePath {
    if (!_filePath) {
        NSArray *paths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *homePath = [paths objectAtIndex:0];
        _filePath = [homePath stringByAppendingPathComponent:@"crash.txt"];
    }
    return _filePath;
}

+ (void)writefile:(NSString *)string {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:[ExceptionHandler defaultHandler].filePath]) {
        NSLog(@"-------文件不存在，写入文件----------");
        NSError *error;
        if([string writeToFile:[ExceptionHandler defaultHandler].filePath atomically:YES encoding:NSUTF8StringEncoding error:&error])  {
            NSLog(@"------写入文件------success");
        } else {
            NSLog(@"------写入文件------fail,error==%@",error);
        }
    } else {
        NSLog(@"-------文件存在，追加文件----------");
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[ExceptionHandler defaultHandler].filePath];
        [fileHandle seekToEndOfFile];  //将节点跳到文件的末尾
        NSData* stringData  = [string dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:stringData]; //追加写入数据
        [fileHandle closeFile];
    }
}

+ (NSString *)getCrachInfo {
    if ([ExceptionHandler defaultHandler].supportWriteFile) {
        return [ExceptionHandler defaultHandler].filePath;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:kExceptionInfoKey];
}

+ (BOOL)hasCrashInfo {
    return [self getCrachInfo].length > 0;
}

+ (BOOL)removeCrashInfo {
    if (![ExceptionHandler defaultHandler].supportWriteFile) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kExceptionInfoKey];
    }
    BOOL result=[[NSFileManager defaultManager] fileExistsAtPath:[ExceptionHandler defaultHandler].filePath];
    if (!result) {
        return YES;
    }else {
        return [[NSFileManager defaultManager] removeItemAtPath:[ExceptionHandler defaultHandler].filePath error:nil];
        
    }
}

@end
