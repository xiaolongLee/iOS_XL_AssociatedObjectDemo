//
//  Test5ViewController.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "Test5ViewController.h"
#import <objc/runtime.h>
@interface Test5ViewController ()

@end

@implementation Test5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//4. 关联对象：关联观察者对象

//有时候我们在分类中使用NSNotificationCenter或者KVO，推荐使用关联的对象作为观察者，尽量避免对象观察自身。
//
//例如大名鼎鼎的AFNetworking为菊花控件监听NSURLSessionTask以获取网络进度的分类：

// 5. 关联对象：为了不重复执行
// 需要将字典转成模型对象
// 我们先获取到对象所有的属性名（只执行一次），然后加入到一个数组里面，然后再遍历，利用KVC进行键值赋值。在程序运行的时候，抓取对象的属性，这时候，要利用到运行时的关联对象了，详情见下面的代码。
static char *propertiesKey = "PersonNameKey";
+ (NSArray *)propertyList {
    // 0. 判断是否存在关联对象，如果存在，直接返回
    /**
     1> 关联到的对象
     2> 关联的属性 key
     
     提示：在 OC 中，类本质上也是一个对象
     */
    NSArray *plist = objc_getAssociatedObject(self, propertiesKey);
    if (plist != nil) {
        return plist;
    }
    
    // 1. 获取`类`的属性
    /**
     参数
     1> 类
     2> 属性的计数指针
     */
    
    unsigned int count = 0;
    // 返回值是所有属性的数组 objc_property_t
    objc_property_t *list = class_copyPropertyList([self class], &count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
      // 遍历数组
    for (unsigned int i = 0; i < count; ++i) {
        // 获取到属性
        objc_property_t pty = list[i];
        
        // 获取属性的名称
        const char *cname = property_getName(pty);
        
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
        
        
    }
    
      NSLog(@"%@", arrayM);
    
    // // 释放属性数组
    free(list);
    
    // 设置关联对象
    /**
     1> 关联的对象
     2> 关联对象的 key
     3> 属性数值
     4> 属性的持有方式 reatin, copy, assign
     */
    
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return arrayM.copy;
    
}


+ (instancetype)objectWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
     //    [obj setValuesForKeysWithDictionary:dict];
    NSArray *properties = [self propertyList];
    
    //  // 遍历属性数组
    
    for (NSString *key in properties) {
        // 判断字典中是否包含这个key
        if (dict[key] != nil) {
             // 使用 KVC 设置数值
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}

@end
