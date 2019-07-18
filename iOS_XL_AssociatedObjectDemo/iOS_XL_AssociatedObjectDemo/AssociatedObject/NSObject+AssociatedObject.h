//
//  NSObject+AssociatedObject.h
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AssociatedObject)
@property (nonatomic, strong) id associatedObject;
@end

NS_ASSUME_NONNULL_END
