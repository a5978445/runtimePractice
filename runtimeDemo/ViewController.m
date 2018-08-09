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

#import "HuManPropertyTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   HuManPropertyTool *tool = [[HuManPropertyTool alloc]init];
    [tool test];
    

 
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






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
