//
//  ViewController.m
//  propertyDemo
//
//  Created by 李腾芳 on 2019/1/22.
//  Copyright © 2019年 HSBC Holdings plc. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc.h>
#import <objc/runtime.h>

#define kUserModelClassName "Human"

void setUserName(id self, SEL _cmd, NSString *name) {
    
    Ivar ivar = class_getInstanceVariable([self class], "_userName");
    
    object_setIvar(self, ivar, name);
    
}

NSString* userName(id self, SEL _cmd) {
    
    // 获取类中指定名称实例成员变量的信息
    Ivar ivar = class_getInstanceVariable([self class], "_userName");
    
    return object_getIvar(self, ivar);
    
}


@interface UserModel: NSObject

@property(copy, nonatomic, getter=c_userName, setter=c_setteruserName:) NSString* userName;

@end

@interface UserModel() {
  //  NSString *_userName;
   //  NSString *__userName;
   // NSMutableDictionary *_dictCustomerProperty;
}


@end

@implementation UserModel

//- (NSString *)userName {
//    return _userName;
//}
//
//- (void)setuserName:(NSString *)userName {
//    _userName = userName.copy;
//}


+ (BOOL)accessInstanceVariablesDirectly {
    return false;
}

@end

@interface ViewController () {
    NSString *_p;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 /*
    [self logClass:UserModel.class];

    objc_property_t objc_property_t_UserModel_userName = class_getProperty(UserModel.class, "userName");
    NSLog(@"%s", property_getAttributes(objc_property_t_UserModel_userName));
    
    
    
    NSLog(@"%s", property_copyAttributeValue(objc_property_t_UserModel_userName, "V"));
    
    NSLog(@"%s", property_copyAttributeValue(objc_property_t_UserModel_userName, "G"));
    
    NSLog(@"%s", property_copyAttributeValue(objc_property_t_UserModel_userName, "S"));
    
    
    UserModel *model = [UserModel new];
    [model setValue:@"fitch" forKey:@"userName"];
    NSLog(@"%@", model.c_userName);
    
  
    
 */
    
    /*
    registerUserModelClass();
    [self logClass:objc_getClass(kUserModelClassName)];
    
    id userModel = [[objc_getClass(kUserModelClassName) class] new];
    NSLog(@"%@", userModel);
    [userModel performSelector:@selector(setUserName:) withObject:@"*******"];

    NSLog([userModel performSelector:@selector(userName)]);
    
    */
    
    /*
    UserModel *model = [UserModel new];
    [model setValue:@"wolf" forKey:@"userName"];
    NSLog(@"%@", model.userName);
    */
    
    
    registerUserModelClass();
    Class class = objc_getClass(kUserModelClassName);

    const uint8_t *t_layout = class_getIvarLayout(UserModel.class);
    const uint8_t *layout = class_getIvarLayout(class);
    const uint8_t *weakLayout = class_getWeakIvarLayout(class);
  //  NSLog(@"%d", *layout);
    NSLog(@"%d", *class_getWeakIvarLayout(NSObject.class));
    
  //  NSurlsession
}

- (void)logClass:(Class)class {
    
    unsigned int methodCount;
    Method *methodList = class_copyMethodList(class, &methodCount);
    for (int i = 0; i < methodCount; i++) {
        NSLog(@"%s", sel_getName(method_getName(methodList[i])));
    }
    
    unsigned int ivarCount;
    Ivar *ivarList = class_copyIvarList(class, &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        NSLog(@"%s", ivar_getName(ivarList[i]));
    }
    
}


void registerUserModelClass() {
    
    
    Class MyClass = objc_allocateClassPair([NSObject class], kUserModelClassName , 0);
    
    class_addIvar(MyClass, "_userName" , sizeof(NSString *), log2(sizeof(NSString *)), "@") ;
   
    objc_property_attribute_t type = { "T", "@\"NSString\"" };
    objc_property_attribute_t ownership = { "C", "" }; // C = copy
    objc_property_attribute_t backingivar  = { "V", "_userName" };
    objc_property_attribute_t attrs[] = { type, ownership, backingivar };
    
    
    class_addMethod(MyClass, @selector(setUserName:), (IMP)setUserName, "V@:@");
    class_addMethod(MyClass, @selector(userName), (IMP)userName, "@@:");

    //注册这个类到runtime系统中就可以使用他了
    objc_registerClassPair(MyClass);
    
    if (!class_addProperty(MyClass, "ad_id", attrs, 3)) {
        
        NSLog(@"add property failure");
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
