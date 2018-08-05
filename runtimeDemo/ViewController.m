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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Class a = [NSObject class];
    Class b = [NSObject class];
    Class c = [NSObject class];
    Class d = [NSObject class];
    
     NSLog(@"%@",[NSObject class]);
    NSLog(@"%@",[NSObject class]);
    NSLog(@"%@",[NSObject class]);
    NSLog(@"%@",[NSObject class]);
  //  objc_msgSend()
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
