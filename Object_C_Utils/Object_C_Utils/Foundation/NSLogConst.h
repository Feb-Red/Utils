//
//  NSLogConst.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/9/8.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#ifndef NSLogConst_h
#define NSLogConst_h

#ifdef DEBUG
#  define NSLog(fmt, ...) do {                                            \
NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
[file release];                                                 \
} while(0)
#else
# define NSLog(...);

#endif /* NSLogConst_h */
