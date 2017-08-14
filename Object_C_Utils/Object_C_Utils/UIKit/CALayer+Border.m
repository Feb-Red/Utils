//
//  CALayer+Border.m
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import "CALayer+Border.h"
#import <UIKit/UIKit.h>

@implementation CALayer (Border)

- (void)setBorderColorWithUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
