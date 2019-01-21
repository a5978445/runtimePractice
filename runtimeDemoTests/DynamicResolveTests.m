//
//  ResolveMethodTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/6.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFAdder.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface DynamicResolveTests : XCTestCase

@end

@implementation DynamicResolveTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDynamicResolveClassMethod {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSUInteger result = (NSUInteger)objc_msgSend([XFAdder class], @selector(addTwo:),12);
    XCTAssert(result == 14);
}

- (void)testDynamicResolveInstanceMethod {
    NSUInteger result = (NSUInteger)objc_msgSend([[XFAdder alloc]init], @selector(addThree:),12);
    XCTAssert(result == 15);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
