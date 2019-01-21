//
//  DerivedClassTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/9.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFAdder.h"
#import <objc/runtime.h>
#import "XFADModel.h"
#import "XFAdder.h"


@interface DerivedClassTests : XCTestCase

@end

@implementation DerivedClassTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDerivedClass {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // KVO 模式
    // 在 addObserver的时候，会生成相应的衍生类 ，衍生类会重写setter方法
    
    XFADModel *aModel = [[XFADModel alloc]init];
    XFADModel *bModel = [[XFADModel alloc]init];
    
    [aModel addObserver:aModel forKeyPath:@"ad_name" options:NSKeyValueObservingOptionNew context:nil];
    
    Class aModel_isa = object_getClass(aModel);
    Class bModel_isa = object_getClass(bModel);
    
    XCTAssert(![aModel_isa isEqual:bModel_isa]);
    XCTAssert([bModel_isa isEqual:[XFADModel class]]);

}

- (void)testMethodSwizzle {
    XFAdder *aXFAdder = [[XFAdder alloc]init];
    XCTAssert([aXFAdder subOne:12] == 10);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
