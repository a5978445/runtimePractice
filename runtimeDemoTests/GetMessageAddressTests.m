//
//  GetMessageAddressTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/6.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFAdder.h"
#import <objc/runtime.h>

@interface GetMessageAddressTests : XCTestCase

@end

@implementation GetMessageAddressTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testGettingMethodAddress {
    NSUInteger (*setter)(id, SEL, NSUInteger);
    XFAdder *adder = [[XFAdder alloc]init];
    
    setter = (NSUInteger (*)(id, SEL, NSUInteger))[adder
                                       methodForSelector:@selector(add:)];
    
    XCTAssert(setter != NULL);
    
    NSUInteger result = 0;
    for (int i = 0 ; i < 1000 ; i++ ) {
        result = setter(adder, @selector(add:), result);
    }
    
    NSUInteger standardResult = 0;
    for (int i = 0; i < 1000; i++) {
        standardResult += 1;
    }
    
    XCTAssert(standardResult == result);
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
