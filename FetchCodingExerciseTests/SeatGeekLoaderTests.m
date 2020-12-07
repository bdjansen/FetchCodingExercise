//
//  SeatGeekLoaderTests.m
//  FetchCodingExerciseTests
//
//  Created by Blake Jansen on 12/6/20.
//

#import <XCTest/XCTest.h>
#import "SeatGeekLoader.h"

@interface SeatGeekLoaderTests : XCTestCase

@end

@implementation SeatGeekLoaderTests {
    NSData *_data;
    SeatGeekLoader *_seatGeekLoader;
}

- (void)setUp {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FakeDataFile" ofType:nil];
    NSString *dataString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    _data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    _seatGeekLoader = [SeatGeekLoader new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testSuccess {
    
}

- (void)testCount {
    NSArray<SeatGeekEvent *>*events = [_seatGeekLoader getEventData];
    XCTAssert(events.count == 10);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
