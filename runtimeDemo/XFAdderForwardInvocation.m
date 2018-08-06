//
//  XFAdderForwardInvocation.m
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/6.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import "XFAdderForwardInvocation.h"
#import "XFAdder.h"



@implementation XFAdderForwardInvocation {
    XFAdder *_adder;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _adder = [[XFAdder alloc]init];
    }
    return self;
}


// 这个比较无脑，使用起来也比较方便
/*
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:");
    return _adder;
}
*/

// 使用 forwardInvocation 必须override methodSignatureForSelector: 方法，
// 否则 forwardInvocation 方法不会执行
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  //  return [NSMethodSignature signatureWithObjCTypes:"@@:@"];
    
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [_adder methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:");
    if ([_adder respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_adder];
    } else {
        [super forwardInvocation:anInvocation];
    }
    
}


@end
