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
#include <stdio.h>

//#import <objc/objc-load.h >
// objc/objc-load.h , objc_loadModules
#import "XFAdder.h"
#import "XFAdderForwardInvocation.h"
#import "XFADModel.h"
#import "DynamicCreateHumanClassTool.h"

#import "HuManPropertyTool.h"

@interface ViewController ()

@end

@implementation ViewController

// method swizzle
+ (void)load {
    Method customViewDidLoad = class_getInstanceMethod(self, @selector(customViewDidLoad));
    Method viewDidload = class_getInstanceMethod(self,@selector(viewDidLoad));
    
    method_exchangeImplementations(customViewDidLoad, viewDidload);
}

- (void)customViewDidLoad {
    NSLog(@"customViewDidLoad");
    [self customViewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    
    
    //    NSMutableString *helloString = [[NSMutableString alloc]init];
    //    [helloString appendString:@"hello"];
    //
    //    XFADModel *model = [[XFADModel alloc]init];
    //  //  [model setAd_name:helloString];
    //    [model setValue:helloString forKeyPath:@"ad_name"];
    //
    //    [helloString appendString:@" boy"];
    //
    //    NSLog(@"helloString = %@", helloString);
    //    NSLog(@"model.ad_name = %@", model.ad_name);
    //
    //    NSLog(@"xx");
    
    
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
