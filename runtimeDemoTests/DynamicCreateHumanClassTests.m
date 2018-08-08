//
//  DynamicCreateHumanClassTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/5.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DynamicCreateHumanClassTool.h"
#import <objc/runtime.h>

@interface DynamicCreateHumanClassTests : XCTestCase

@end

@implementation DynamicCreateHumanClassTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    registerHuManClass();
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.

    [super tearDown];
    disposeClass();
}

- (void)testregisterHuManClass {
    disposeClass();
    assert(registerHuManClass() == YES);
    assert(registerHuManClass() == NO);
    
}

- (void)testSetInstanceValue {
    Class huManClass = objc_lookUpClass(kHuMan);
    assert(huManClass != NULL);
    id aHuMan = [[huManClass alloc]init];
    [aHuMan setValue:@"Fitch" forKey:@kHuMan_name];
    
    assert([[aHuMan valueForKey:@kHuMan_name] isEqual:@"Fitch"]);
}

- (void)testDisposeClass {
    Class huManClass = objc_lookUpClass(kHuMan);
    assert(huManClass != NULL);
    disposeClass();
    assert(objc_lookUpClass(kHuMan) == NULL);
}

- (void)testHumanInstance_SayHelloSel {
    
    Class huManClass = objc_lookUpClass(kHuMan);
    assert(huManClass != NULL);
    
    
    /*
     // equivalent:
     id myobjc = objc_msgSend(MyClass, @selector(alloc));
     myobjc = objc_msgSend(myobjc, @selector(init));
     需要做一下设置，否则编译器会报错  Build Settings -->  搜索 objc --> 设置 Enable Strict Checking of objc-msgSend Calls    为 NO
     
     
     */
    id aHuMan = [[huManClass alloc]init];
    [aHuMan setValue:@"Fitch" forKey:@kHuMan_name];
    
    //equivalent:
    //objc_msgSend(myobjc, @selector(addMethodForMyClass:), @"hello boy");
    NSString *result = (NSString *)[aHuMan performSelector:kHuMan_sayHello_sel withObject:@"Neil"];
    XCTAssert([result isEqualToString:@"Fitch: hello Neil"]);
    
    
    
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

