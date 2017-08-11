//
//  DateUtils.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

+ (long long)longlongFromCurrentDate {
    NSDate *date = [NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]];
    return [date timeIntervalSince1970] * 1000;
}

+ (NSString *)formatDate:(NSDate *)date pattern:(NSString *)pattern {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:pattern];
    return [format stringFromDate:date];
}

+ (NSString *)formatLongLongTime:(long long)time pattern:(NSString *)pattern {
    if (time == 0) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    return [self formatDate:date pattern:pattern];
}

+ (NSDate *)formatDateString:(NSString *)date pattern:(NSString *)pattern {
     NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateStyle = kCFDateFormatterFullStyle;
    [format setDateFormat:pattern];
    return [format dateFromString:date];
}

+ (NSString *)formatLongLongTime:(long long)time pattern:(NSString *)pattern timeZone:(NSString *)timeZone {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateStyle = kCFDateFormatterFullStyle;
    [format setDateFormat:pattern];
    format.timeZone = [NSTimeZone timeZoneWithName:timeZone];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [format stringFromDate:date];
}

@end
