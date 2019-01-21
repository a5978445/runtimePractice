//
//  GetMessageAddressTools.m
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/6.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import "XFAdder.h"
#import <objc/objc.h>
#import <objc/runtime.h>




@implementation XFAdder

+ (void)load {
    Method subone = class_getInstanceMethod(self, @selector(subOne:));
    Method subTwo = class_getInstanceMethod(self, @selector(subTwo:));
    
    // 交换 imp
    method_exchangeImplementations(subone, subTwo);
}

- (NSUInteger)subOne:(NSUInteger)original {
    return original - 1;
}

- (NSUInteger)subTwo:(NSUInteger)original {
    return original - 2;
}

- (NSUInteger)add:(NSUInteger)original {
    return original + 1;
}

+ (BOOL)resolveClassMethod:(SEL)sel {
  
    
    if (sel == sel_getUid("addTwo:")) {
        Class metaClass = objc_getMetaClass(class_getName([self class]));
        class_addMethod(metaClass, sel, (IMP)addTwo, "Q@:Q");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == sel_getUid("addThree:")) {
        
        NSLog(@"%s",@encode(NSUInteger));
        
        class_addMethod([self class], sel, (IMP)addThree, "Q@:Q");
        return YES;
    }
 
    
    return [super resolveInstanceMethod:sel];
}



// (id _Nonnull, SEL _Nonnull, ...

NSUInteger addTwo(id self, SEL _cmd, NSUInteger original)  {
    return original + 2;
}

NSUInteger addThree(id self, SEL _cmd, NSUInteger original) {
    return original + 3;
}


@end


