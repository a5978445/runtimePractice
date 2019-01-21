//
//  ForwardInvocationTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/6.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFAdderForwardInvocation.h"
#import <objc/runtime.h>

@interface MessageForwardInvocationTests : XCTestCase

@end

@implementation MessageForwardInvocationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testForwardInvocation {
  
    
    XFAdderForwardInvocation *aAdderForwardInvocation = [[XFAdderForwardInvocation alloc]init];
    
    XCTAssert(![aAdderForwardInvocation respondsToSelector:@selector(addThree:)]);
    
    NSUInteger result = [aAdderForwardInvocation addThree:12];
    
    XCTAssert(result == 15);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
