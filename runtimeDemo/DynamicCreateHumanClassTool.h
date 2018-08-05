//
//  DynamicCreateHumanClassTool.h
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/4.
//  Copyright © 2018年 李腾芳. All rights reserved.

#define kHuMan  "XFHuMan"
#define KHuMan_name  "name"
#define kHuMan_sayHello_sel @selector(sayHello:)


#import <Foundation/Foundation.h>
//#import <AppKit/AppKit.h>



extern BOOL createClass(void);
extern void disposeClass(void);
extern void test(void);
