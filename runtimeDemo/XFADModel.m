//
//  ADModel.m
//  MobileProject
//
//  Created by LiTengFang on 2017/3/29.
//  Copyright © 2017年 com.boli. All rights reserved.
//

#import "XFADModel.h"
#import <objc/objc.h>
#import <objc/runtime.h>

// @property(strong,nonatomic) NSString *ad_id;

@implementation XFADModel {
    
    NSString *_ad_id;
}

+ (void)load {
    
    objc_property_attribute_t type = { "T", "@\"NSString\"" };
    objc_property_attribute_t ownership = { "C", "" }; // C = copy
    objc_property_attribute_t backingivar  = { "V", "_ad_id" };
    objc_property_attribute_t attrs[] = { type, ownership, backingivar };
    
    // 以下代码会failiure  因为类一旦完成注册就无法添加 ivar
    
//    BOOL isSucess = class_addIvar(self, "ad_id", sizeof(NSString *), log2(sizeof(NSString *)), "@");
//    if (!isSucess) {
//        NSLog(@"add ivar failure");
//    }
    
    
    if (!class_addProperty(self, "ad_id", attrs, 3)) {
        
        NSLog(@"add property failure");

    }
    
    // 这个是可以添加的
    if (!class_addMethod(self, @selector(helloWorld), (IMP)helloWorld, "V@:")) {
        NSLog(@"add method failure");
    }
    
    
    
}

void helloWorld(id self, SEL _cmd) {
    NSLog(@"helloWorld");
}

- (void)setAd_id:(NSString *)ad_id {
    
    Ivar  ivar_ad_id = class_getInstanceVariable([self class], "_ad_id");
    object_setIvar(self, ivar_ad_id, [ad_id copy]);
    
}

- (NSString *)ad_id {
    
    // ivar
    Ivar  ivar_ad_id = class_getInstanceVariable([self class], "_ad_id");
    return  object_getIvar(self, ivar_ad_id);
    
    // kvc
    return [self valueForKey:@"ad_id"];
    
}

////在目标target上添加属性，属性名propertyname，值value
//+ (void)addPropertyWithtarget:(id)target withPropertyName:(NSString *)propertyName withValue:(id)value {
//
//    //先判断有没有这个属性，没有就添加，有就直接赋值
//    Ivar ivar = class_getInstanceVariable([target class], [[NSString stringWithFormat:@"_%@", propertyName] UTF8String]);
//    if (ivar) {
//        return;
//    }
//
//    /*
//     objc_property_attribute_t type = { "T", "@\"NSString\"" };
//     objc_property_attribute_t ownership = { "C", "" }; // C = copy
//     objc_property_attribute_t backingivar  = { "V", "_privateName" };
//     objc_property_attribute_t attrs[] = { type, ownership, backingivar };
//     class_addProperty([SomeClass class], "name", attrs, 3);
//     */
//
//    //objc_property_attribute_t所代表的意思可以调用getPropertyNameList打印，大概就能猜出
//    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([value class])] UTF8String] };
//    objc_property_attribute_t ownership = { "&", "N" };
//    objc_property_attribute_t backingivar  = { "V", [[NSString stringWithFormat:@"_%@", propertyName] UTF8String] };
//    objc_property_attribute_t attrs[] = { type, ownership, backingivar };
//    if (class_addProperty([target class], [propertyName UTF8String], attrs, 3)) {
//
//        //添加get和set方法
//        class_addMethod([target class], NSSelectorFromString(propertyName), (IMP)getter, "@@:");
//        class_addMethod([target class], NSSelectorFromString([NSString stringWithFormat:@"set%@:",[propertyName capitalizedString]]), (IMP)setter, "v@:@");
//
//        //赋值
//        [target setValue:value forKey:propertyName];
//        NSLog(@"%@", [target valueForKey:propertyName]);
//
//       // YYLog(@"创建属性Property成功");
//    } else {
//        class_replaceProperty([target class], [propertyName UTF8String], attrs, 3);
//        //添加get和set方法
//        class_addMethod([target class], NSSelectorFromString(propertyName), (IMP)getter, "@@:");
//        class_addMethod([target class], NSSelectorFromString([NSString stringWithFormat:@"set%@:",[propertyName capitalizedString]]), (IMP)setter, "v@:@");
//
//        //赋值
//        [target setValue:value forKey:propertyName];
//    }
//}
//
//id getter(id self1, SEL _cmd1) {
//    NSString *key = NSStringFromSelector(_cmd1);
//    Ivar ivar = class_getInstanceVariable([self1 class], "_dictCustomerProperty");  //basicsViewController里面有个_dictCustomerProperty属性
//    NSMutableDictionary *dictCustomerProperty = object_getIvar(self1, ivar);
//    return [dictCustomerProperty objectForKey:key];
//}
//
//void setter(id self1, SEL _cmd1, id newValue) {
//    //移除set
//    NSString *key = [NSStringFromSelector(_cmd1) stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
//    //首字母小写
//    NSString *head = [key substringWithRange:NSMakeRange(0, 1)];
//    head = [head lowercaseString];
//    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:head];
//    //移除后缀 ":"
//    key = [key stringByReplacingCharactersInRange:NSMakeRange(key.length - 1, 1) withString:@""];
//
//    Ivar ivar = class_getInstanceVariable([self1 class], "_dictCustomerProperty");  //basicsViewController里面有个_dictCustomerProperty属性
//    NSMutableDictionary *dictCustomerProperty = object_getIvar(self1, ivar);
//    if (!dictCustomerProperty) {
//        dictCustomerProperty = [NSMutableDictionary dictionary];
//        object_setIvar(self1, ivar, dictCustomerProperty);
//    }
//    [dictCustomerProperty setObject:newValue forKey:key];
//}
//
//+ (id)getPropertyValueWithTarget:(id)target withPropertyName:(NSString *)propertyName {
//    //先判断有没有这个属性，没有就添加，有就直接赋值
//    Ivar ivar = class_getInstanceVariable([target class], [[NSString stringWithFormat:@"_%@", propertyName] UTF8String]);
//    if (ivar) {
//        return object_getIvar(target, ivar);
//    }
//
//    ivar = class_getInstanceVariable([target class], "_dictCustomerProperty");  //basicsViewController里面有个_dictCustomerProperty属性
//    NSMutableDictionary *dict = object_getIvar(target, ivar);
//    if (dict && [dict objectForKey:propertyName]) {
//        return [dict objectForKey:propertyName];
//    } else {
//        return nil;
//    }
//}

@end
