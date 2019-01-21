//
//  HuManPropertyTool.m
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/8.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import "HuManPropertyTool.h"

#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>

//#import <objc/objc-load.h >
// objc/objc-load.h , objc_loadModules
#import "XFAdder.h"
#import "XFAdderForwardInvocation.h"
#import "XFADModel.h"
#import "DynamicCreateHumanClassTool.h"

@implementation HuManPropertyTool

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)test {
    registerHuManClass();
    
    Class Human = objc_lookUpClass(kHuMan);
    
    
    Class Human_MetaClass = objc_getMetaClass("kHuMan");
    
  //  classsize
    NSLog(@"%d",class_getInstanceSize(Human));
    NSLog(@"%d", class_getInstanceSize(Human_MetaClass));
    
    id aHumanObject = [[Human alloc]init];
    
    [self setHumanNameValue:aHumanObject];
    [self setHumanAge:aHumanObject];
    [self setHumanIsYoung:aHumanObject];
    
    //  Ivar ivar_human_age = class_getInstanceVariable(Human, kHuMan_age);
    // object_setIvar(aHumanObject, ivar_human_age, @12);
    
    id human_age = [aHumanObject valueForKey:@kHuMan_age];
    id human_isYoung = [aHumanObject valueForKey:@kHuman_isYoung];
    
    //   sleep(2);

    Ivar aIvar_HuMan_name = class_getInstanceVariable(Human, kHuMan_name);
    NSString *result_of_find_ivar = object_getIvar(aHumanObject, aIvar_HuMan_name);
    
    
    
    
    
    //    NSString *result_of_find_KVC = [aHumanObject valueForKey:@kHuMan_name];
    //    assert([result_of_find_KVC isEqualToString:@"fitch"]);
    //    assert([result_of_find_ivar isEqualToString:@"fitch"]);
    
    
    const uint8_t *dx = class_getIvarLayout(Human);
    const uint8_t *dxb = class_getWeakIvarLayout(Human);
    printf("%d\n", *class_getIvarLayout(Human));
    //    class_setIvarLayout(<#Class  _Nullable __unsafe_unretained cls#>, <#const uint8_t * _Nullable layout#>)
    //
    //
    const uint8_t *dxbxx = class_getIvarLayout([XFADModel class]);
    const uint8_t *dxbxx_weak = class_getWeakIvarLayout([XFADModel class]);
    printf("%d\n", *class_getIvarLayout([XFADModel class]));
    
    
    NSLog(@"asad");
}


- (void)setHumanNameValue:(id)aHumanObject {
    
    NSMutableString *fitch = [[NSMutableString alloc]initWithString:@"fitch"];
    [aHumanObject setValue:fitch forKey:@kHuMan_name];
    
    
    [fitch appendFormat:@" Li"];
    
}

- (void)setHumanAge:(id)aHumanObject {
    NSNumber *aNumber = @13;
    NSString *poc = [NSString stringWithFormat:@"%p", &aNumber];
    NSLog(@"setHumanAge address: %@", poc);
    
    [aHumanObject setValue:aNumber forKey:@kHuMan_age];
    
}


- (void)setHumanIsYoung:(id)aHumanObject {
    NSNumber *aNumber = @YES;
    NSString *poc = [NSString stringWithFormat:@"%p", aNumber];
    NSLog(@"setHumanIsYoung addres: %@", poc);
    
    [aHumanObject setValue:aNumber forKey:@kHuman_isYoung];
}

@end
