//
//  UIAlertView+Handle.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "UIAlertView+Handle.h"
#import <objc/runtime.h>
@implementation UIAlertView (Handle)
- (void)setCallBlock:(ClickBlock)callBlock {
    
    objc_setAssociatedObject(self, @selector(callBlcok), callBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (ClickBlock)callBlock {
    
    return  objc_getAssociatedObject(self, _cmd);
}
@end
