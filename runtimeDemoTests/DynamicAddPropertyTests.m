//
//  DynamicAddPropertyTests.m
//  runtimeDemoTests
//
//  Created by 李腾芳 on 2018/8/7.
//  Copyright © 2018年 李腾芳. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFADModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface DynamicAddPropertyTests : XCTestCase

@end


@implementation DynamicAddPropertyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDynamicAddProperty {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XFADModel *aADModel = [[XFADModel alloc]init];
    [aADModel performSelector:@selector(setAd_id:) withObject:@"hhhhhhhhh"];
    NSString *result = [aADModel performSelector:@selector(ad_id)];
    
    [aADModel performSelector:@selector(helloWorld)];
    
    XCTAssert([result isEqualToString:@"hhhhhhhhh"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
