//
//  UIAlertView+Handle.h
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 声明一个button点击事件的回调block

typedef void(^ClickBlock)(NSInteger buttonIndex);

@interface UIAlertView (Handle)

@property (nonatomic, copy) ClickBlock callBlock;

@end

NS_ASSUME_NONNULL_END
