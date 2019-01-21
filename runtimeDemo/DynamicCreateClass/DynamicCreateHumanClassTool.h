//
//  DynamicCreateHumanClassTool.h
//  runtimeDemo
//
//  Created by 李腾芳 on 2018/8/4.
//  Copyright © 2018年 李腾芳. All rights reserved.

#define kHuMan  "XFHuMan"
#define kHuMan_name  "name"
#define kHuMan_age  "age"
#define kHuman_isYoung "young"

#define kHuMan_sayHello_sel sel_getUid("sayHello:")

#define kHuMmanCLassCustomDescription  @"this is human metal Class"


#import <Foundation/Foundation.h>



extern BOOL registerHuManClass(void);
extern void disposeClass(void);
extern void test(void);
