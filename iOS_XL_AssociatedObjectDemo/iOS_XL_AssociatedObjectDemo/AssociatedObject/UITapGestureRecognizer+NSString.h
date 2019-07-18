//
//  UITapGestureRecognizer+NSString.h
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITapGestureRecognizer (NSString)
//类拓展添加属性
@property (nonatomic, copy) NSString *dataStr;
@end

NS_ASSUME_NONNULL_END
