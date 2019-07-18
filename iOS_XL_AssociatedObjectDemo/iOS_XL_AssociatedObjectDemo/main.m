//
//  main.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


// 1. 什么是关联对象
// 1.1 关联对象
// 分类(category)与关联对象(Associated Object)作为objective-c的扩展机制的两个特性：分类，可以通过它来扩展方法；Associated Object，可以通过它来扩展属性；




// 1.2 如何关联对象
//runtime提供了給我们3个API以管理关联对象（存储、获取、移除）：
//- (void)test{
//    //关联对象
//    //  void  objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
//
//    //获取关联的对象
//    //    id objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
//
//    //移除关联的对象
//
//    // void objc_removeAssociatedObjects(<#id  _Nonnull object#>)
//
//    //    id object：被关联的对象
//    //    const void *key：关联的key，要求唯一
//    //    id value：关联的对象
//    //    objc_AssociationPolicy policy：内存管理的策略
//}
//
//- (void)test2 {
//
//}


//2. 关联对象：为分类添加“属性”
// 2.1 分类的限制
/*
 @interface Person : NSObject
 
 @property (nonatomic, strong) NSString *name;
 
 @end
 
 */
// 在使用上述@property 时会做三件事：

//生成实例变量 _property
//生成 getter 方法 - property
//生成 setter 方法 - setProperty:



/*
 @implementation DKObject {
 NSString *_property;
 }
 
 - (NSString *)property {
 return _property;
 }
 
 - (void)setProperty:(NSString *)property {
 _property = property;
 }
 
 @end
 */

//这些代码都是编译器为我们生成的，虽然你看不到它，但是它确实在这里。但是，如果我们在分类中写一个属性，则会给一个警告，分类中的 @property 并没有为我们生成实例变量以及存取方法，而需要我们手动实现。

//因为在分类中 @property 并不会自动生成实例变量以及存取方法，所以一般使用关联对象为已经存在的类添加 “属性”。解决方案：可以使用两个方法  objc_getAssociatedObject 以及 objc_setAssociatedObject 来模拟属性 的存取方法，而使用关联对象模拟实例变量。

//2.2
