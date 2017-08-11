//
//  NSString+AppInfo.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AppInfo)

/**
 Get app build no.

 @return build no string.
 */
+ (NSString *)buildNo;

/**
 Get app version no.

 @return version no string.
 */
+ (NSString *)versionNo;

/**
 Get app name.

 @return app name.
 */
+ (NSString *)appName;

/**
 Get device model.

 @return device model.
 */
+ (NSString *)deviceModel;

/**
 Get device name

 @return device name.
 */
+ (NSString *)deviceName;

/**
 Get device version.

 @return device version.
 */
+ (NSString *)deviceVersion;

/**
 Get device model.

 @return device model.
 */
+ (NSString *)deviceDetailModel;

/**
 Get device system name.

 @return device system name.
 */
+ (NSString *)deviceSystemName;



@end
