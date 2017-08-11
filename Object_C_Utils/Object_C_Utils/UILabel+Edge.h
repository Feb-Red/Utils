//
//  UILabel+Edge.h
//  Object_C_Utils
//
//  Created by xu_cheng on 2017/8/11.
//  Copyright © 2017年 com.crfchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Edge)

/**
 修改label内容距 `top` `left` `bottom` `right` 边距
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;

@end
