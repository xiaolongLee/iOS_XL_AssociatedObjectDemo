//
//  UIButton+Handle.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "UIButton+Handle.h"
// 声明一个静态的索引key，用于获取被关联对象的值

static char *buttonClickKey;

@implementation UIButton (Handle)


-(void)handleClickCallBack:(ButtonClickBack)callBack {
    // 将button的实例与回调的block通过索引key进行关联：
    objc_setAssociatedObject(self, &buttonClickKey, callBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
     // 设置button执行的方法
    [self addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];

}

- (void)buttonClicked {
    // 通过静态的索引key，获取被关联对象（这里就是回调的block）
    ButtonClickBack callBack = objc_getAssociatedObject(self, &buttonClickKey);
    if (callBack) {
        callBack(self);
    }
}
@end
