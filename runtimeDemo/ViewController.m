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
    return;
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *hello = @"hello world";
    NSLog(@"%@", hello.capitalizedString);
    
    unsigned int count;
    objc_property_t *objc_property_t_list = class_copyPropertyList([XFADModel class], &count);
    XFADModel *aADModel = [[XFADModel alloc]init];
    [aADModel performSelector:@selector(setAd_id:) withObject:@"hhhhhhhhh"];
    NSString *result = [aADModel performSelector:@selector(ad_id)];
    
    [aADModel performSelector:@selector(helloWorld)];
    
    assert([result isEqualToString:@"hhhhhhhhh"]);
    
    // to do support super class KVC
    for (int i = 0; i < count; i++) {
        const char *property_name = property_getName(objc_property_t_list[i]);
        
        NSString *middle = [NSString stringWithFormat:@"%s", property_name];
        NSString *firstChar = [middle substringWithRange:NSMakeRange(0, 1)].uppercaseString;
        middle = [middle stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstChar];
        
        NSString *property_name_string = [NSString stringWithFormat:@"set%@:", middle];
        printf("%s: %s\n",property_name,property_getAttributes(objc_property_t_list[i]));
        //   property_name_string.lowercaseString
        
        
        
        //  [aADModel setValue:@"hello" forKey:[NSString stringWithCString:property_name encoding:NSUTF8StringEncoding]];
       // [aADModel setAd_height:@"asad"];
        [aADModel performSelector:sel_getUid(property_name_string.cString) withObject:@"hello"];
        
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
 //   property_getName(<#objc_property_t  _Nonnull property#>)
    
    
    

    NSLog(@"%s", property_getAttributes(objc_property_t_HuMan_name));
    
    
    
    NSLog(@"asdasd");
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
