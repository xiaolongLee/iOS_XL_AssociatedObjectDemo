//
//  NSObject+AssociatedObject.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
@implementation NSObject (AssociatedObject)

- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//其中， _cmd 代指当前方法的选择子，也就是 @selector(categoryProperty)。_cmd在Objective-C的方法中表示当前方法的selector，正如同self表示当前方法调用的对象实例。这里强调当前，_cmd的作用域只在当前方法里，直指当前方法名@selector。
- (id)associatedObject {
    return objc_getAssociatedObject(self, _cmd);
   // return objc_getAssociatedObject(self, @selector(associatedObject));
}

//typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
//    OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
//    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
//                                            *   The association is not made atomically. */
//    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
//                                            *   The association is not made atomically. */
//    OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
//                                            *   The association is made atomically. */
//    OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
//                                            *   The association is made atomically. */
//};

//objc_AssociationPolicy               modifier
//
//OBJC_ASSOCIATION_ASSIGN                assign
//
//
//OBJC_ASSOCIATION_RETAIN_NONATOMIC   nonatomic, strong
//
//
//OBJC_ASSOCIATION_COPY_NONATOMIC     nonatomic, copy
//
//
//OBJC_ASSOCIATION_RETAIN             atomic, strong
//
//
//OBJC_ASSOCIATION_COPY               atomic, copy


@end
