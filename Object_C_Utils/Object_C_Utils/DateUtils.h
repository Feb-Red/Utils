//
//  DateUtils.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

/**
 Get current time in millis.

 @return current time in millis.
 */
+ (long long)longlongFromCurrentDate;

/**
 Format date to a given pattern.
 
 @param date date to format.
 @param pattern date format pattern.
 @return formatted date string of the given date.
 */
+ (NSString *)formatDate:(NSDate *)date pattern:(NSString *)pattern;

/**
 Format time in millis to a given pattern.

 @param time time in millis to format.
 @param pattern date format pattern.
 @return formatted date string of the given date.
 */
+ (NSString *)formatLongLongTime:(long long)time pattern:(NSString *)pattern;

/**
 Get date a given pattern.

 @param date date in millis to format.
 @param pattern date format parrern.
 @return formated date string of the given date string.
 */
+ (NSDate *)formatDateString:(NSString *)date pattern:(NSString *)pattern;

/**
 Format time to a specific time string.

 @param time time in millions to format.
 @param pattern date format pattern.
 @param timeZone the timeZone of the given time.
 @return formatted date string of the given time.
 */
+ (NSString *)formatLongLongTime:(long long)time pattern:(NSString *)pattern timeZone:(NSString *)timeZone;

@end
