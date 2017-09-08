//
//  UIApplication+Log.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/9/8.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Log)

/**
 Write log to file. e.g /tmp/my_logs.txt

 @param fileName file name
 */
- (void)writeLogToFile:(nonnull NSString *)fileName;

@end
