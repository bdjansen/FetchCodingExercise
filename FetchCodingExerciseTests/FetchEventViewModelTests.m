//
//  FetchEventViewModelTests.m
//  FetchCodingExerciseTests
//
//  Created by Blake Jansen on 12/6/20.
//

#import <XCTest/XCTest.h>
#import "FetchEventViewModel.h"
#import "FetchTestUtilities.h"

@interface FetchEventViewModelTests : XCTestCase

@end

@implementation FetchEventViewModelTests {
    FetchEventViewModel *_fakeEventVM;
}

- (void)setUp {
    _fakeEventVM = [FetchTestUtilities EmptyFetchEvenViewModel];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testToggleFavorite {
    XCTAssert(!_fakeEventVM.favorited);
    
    [_fakeEventVM toggleFavoriteStatus];
    XCTAssert(_fakeEventVM.favorited);
    
    [_fakeEventVM toggleFavoriteStatus];
    XCTAssert(!_fakeEventVM.favorited);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
