//
//  DynamicCreateHumanClassTool.m
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/4.
//  Copyright © 2018年 李腾芳. All rights reserved.

#import "DynamicCreateHumanClassTool.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import <objc/objc.h>


// 动态构建一个如下的类
/*
 1. 创建一个继承NSObject 类
 2. 添加实例属性
 3.添加实例方法
 
 4. 添加 类属性
 5.添加类方法
 6.添加 协议
 
 
 */

/*
 
 next step： 动态创建一个协议
 
 */

/*
 @interface HuMan: NSObject

@property(copy, nonatomic) NSString *name;

- (void)sayHello:(NSString *)name;

@end
 */





// 函数声明
NSString * sayHello(id self, SEL _cmd, NSString *name);

// 这个函数最好传个 NSError ** ,用来反馈具体错误信息
// 这里就不写了，以log 的方式表达
BOOL createClass() {
    
    if (objc_lookUpClass(kHuMan) != NULL) {
        NSLog(@"exist %s class", kHuMan);
        return NO;
    }
    
    Class MyClass = objc_allocateClassPair([NSObject class], kHuMan , 0);
    

    BOOL isSuccess = class_addIvar(MyClass, KHuMan_name , sizeof(NSString *), 0, "@");
    
    if (!isSuccess) {
        return NO;
    }
   
    
    // 3、增加方法
    
    SEL sayHelloSel = sel_getUid("sayHello:");
    
    class_addMethod(MyClass, kHuMan_sayHello_sel, (IMP)sayHello, "V@:");
    // 通过如下方式，可以避免编译器警告
    /*
     
     SEL sayHelloSel = sel_getUid("sayHello:");
     
     class_addMethod(MyClass, sayHelloSel, (IMP)sayHello, "V@:");
     
     */

    //注册这个类到runtime系统中就可以使用他了
    objc_registerClassPair(MyClass);
    return YES;
    

    
}

void disposeClass() {
    if (objc_lookUpClass(kHuMan) == NULL) {
        NSLog(@"unexist %s class", kHuMan);
        return;
    }
    
    objc_disposeClassPair(objc_lookUpClass(kHuMan));
    
}



//self和_cmd是必须的，在之后可以随意添加其他参数
NSString * sayHello(id self, SEL _cmd, NSString *name) {
    
    // 获取类中指定名称实例成员变量的信息
    Ivar ivar = class_getInstanceVariable([self class], KHuMan_name);
    
    // 获取整个成员变量列表
    //   Ivar * class_copyIvarList ( Class cls, unsigned intint * outCount );
    // 获取类中指定名称实例成员变量的信息
    //   Ivar class_getInstanceVariable ( Class cls, const charchar *name );
    // 获取类成员变量的信息
    //   Ivar class_getClassVariable ( Class cls, const charchar *name );
    
    
    // 返回名为test的ivar变量的值
    NSString *myName = object_getIvar(self, ivar);
   // NSLog(@"%@: hello %@", myName, name);
    return [NSString stringWithFormat:@"%@: hello %@", myName, name];
    
//    NSLog(@"%@",obj);
//    NSLog(@"addMethodForMyClass:参数：%@",test);
//    NSLog(@"ClassName：%@",NSStringFromClass([self class]));
    
}


