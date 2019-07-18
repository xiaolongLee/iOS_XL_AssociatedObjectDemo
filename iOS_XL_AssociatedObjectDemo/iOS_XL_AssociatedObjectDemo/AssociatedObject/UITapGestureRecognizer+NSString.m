//
//  UITapGestureRecognizer+NSString.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "UITapGestureRecognizer+NSString.h"
#import <objc/runtime.h>

//定义常量 必须是C语言字符串
static char *PersonNameKey = "PersonNameKey";

@implementation UITapGestureRecognizer (NSString)

- (void)setDataStr:(NSString *)dataStr {
    objc_setAssociatedObject(self, PersonNameKey, dataStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)dataStr {
    return objc_getAssociatedObject(self, PersonNameKey);
}

@end
