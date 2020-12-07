//
//  FetchFavoriteEventsManagerTests.m
//  FetchCodingExerciseTests
//
//  Created by Blake Jansen on 12/6/20.
//

#import <XCTest/XCTest.h>
#import "FetchFavoriteEventsManager.h"
#import "FetchTestUtilities.h"

@interface FetchFavoriteEventsManagerTests : XCTestCase

@end

@implementation FetchFavoriteEventsManagerTests {
    FetchEvent *_fakeEvent;
    FetchFavoriteEventsManager *_favoritesManager;
    NSUserDefaults *_userDefaults;
}

static NSString *const kEventID = @"Fetch.FakeEventID";
static NSString * const kFavoritesArray = @"Fetch.FavoriteDictionary";

- (void)setUp {
    _fakeEvent = [FetchTestUtilities EmptyFetchEvent];
    _favoritesManager = [FetchFavoriteEventsManager new];
    _userDefaults = [NSUserDefaults standardUserDefaults];
}

- (void)tearDown {
    [_favoritesManager removeEventFromFavorites:_fakeEvent];
    [_favoritesManager removeEventFromFavorites:_fakeEvent];
    _favoritesManager = nil;
    _fakeEvent = nil;
    _userDefaults = nil;
}

- (void)testAddCount {
    NSArray *oldFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    
    [_favoritesManager addEventToFavorites:_fakeEvent];
    
    NSArray *newFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    XCTAssert(newFavoritesArray.count == oldFavoritesArray.count + 1);
}

- (void)testAddContains {
    XCTAssert(![_favoritesManager eventIsFavorited:_fakeEvent]);
    [_favoritesManager addEventToFavorites:_fakeEvent];
    XCTAssert([_favoritesManager eventIsFavorited:_fakeEvent]);
}

- (void)testRemoveCount {
    [_favoritesManager addEventToFavorites:_fakeEvent];
    
    NSArray *oldFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    [_favoritesManager removeEventFromFavorites:_fakeEvent];
    NSArray *newFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    XCTAssert(newFavoritesArray.count == oldFavoritesArray.count - 1);
}

- (void)testRemoveContains {
    [_favoritesManager addEventToFavorites:_fakeEvent];
    
    XCTAssert([_favoritesManager eventIsFavorited:_fakeEvent]);
    [_favoritesManager removeEventFromFavorites:_fakeEvent];
    XCTAssert(![_favoritesManager eventIsFavorited:_fakeEvent]);
}

- (void)testDuplicatesCount {
    NSArray *oldFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    
    [_favoritesManager addEventToFavorites:_fakeEvent];
    [_favoritesManager addEventToFavorites:_fakeEvent];
    
    NSArray *newFavoritesArray = [_userDefaults objectForKey:kFavoritesArray];
    XCTAssert(newFavoritesArray.count == oldFavoritesArray.count + 1);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
