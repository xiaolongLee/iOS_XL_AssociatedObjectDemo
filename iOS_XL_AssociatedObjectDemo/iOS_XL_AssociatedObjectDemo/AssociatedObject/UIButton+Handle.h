//
//  UIButton+Handle.h
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN
// 声明一个button点击事件的回调block
typedef void(^ButtonClickBack)(UIButton *button);
@interface UIButton (Handle)
// 为UIButton增加的回调方法
- (void)handleClickCallBack:(ButtonClickBack)callBack;
@end

NS_ASSUME_NONNULL_END
