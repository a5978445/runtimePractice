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


#import "XFAdder.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Class a = [NSObject class];
    Class b = objc_getMetaClass("NSObject");
//    Class c = [NSObject class];
//    Class d = [NSObject class];
//
//     NSLog(@"%@",[NSObject class]);
//    NSLog(@"%@",[NSObject class]);
//    NSLog(@"%@",[NSObject class]);
//    NSLog(@"%@",[NSObject class]);
    
  XFAdder * adder = [[XFAdder alloc]init];
  //  [adder performSelector:@selector(addTwo:) withObject:@12];
//    NSUInteger result =  [(NSUInteger)[XFAdder performSelector:@selector(addTwo:) withObject:12];
    
   NSUInteger result = (NSUInteger)objc_msgSend([XFAdder class], sel_getUid("addTwo:"),12);
    
    
    NSLog(@"%@",[NSObject class]);
    NSLog(@"%@",objc_getMetaClass("NSObject"));
    NSLog(@"asda");
  //  objc_msgSend()
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
