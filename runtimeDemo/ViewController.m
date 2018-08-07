//
//  ViewController.m
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/4.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import "ViewController.h"


#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>

//#import <objc/objc-load.h >
// objc/objc-load.h , objc_loadModules
#import "XFAdder.h"
#import "XFAdderForwardInvocation.h"
#import "XFADModel.h"
#import "DynamicCreateHumanClassTool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    unsigned int count;
    objc_property_t *objc_property_t_list = class_copyPropertyList([XFADModel class], &count);
    XFADModel *aADModel = [[XFADModel alloc]init];
    
    // to do support super class KVC
    for (int i = 0; i < count; i++) {
        const char *property_name = property_getName(objc_property_t_list[i]);
        printf("%s: %s\n",property_name,property_getAttributes(objc_property_t_list[i]));
        
        
        
        
        [aADModel setValue:@"hello" forKey:[NSString stringWithCString:property_name encoding:NSUTF8StringEncoding]];
        
    }
    
    /*
     
     objc_property_t class_getProperty(Class cls, const char *name)
     objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
     
     */
    
  //  objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    
    createClass();
    Class HuMan = objc_getClass(kHuMan);
    NSLog(@"%zu", class_getInstanceSize(HuMan));
    
    
    
    objc_property_t objc_property_t_HuMan_name = class_getProperty(HuMan, KHuMan_name);
    NSLog(@"%s", property_getAttributes(objc_property_t_HuMan_name));
    
    
    
    NSLog(@"asdasd");
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
