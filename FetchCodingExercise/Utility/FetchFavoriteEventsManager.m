//
//  FetchFavoriteEventsManager.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/6/20.
//

#import "FetchFavoriteEventsManager.h"

@implementation FetchFavoriteEventsManager {
    NSUserDefaults *_userDefaults;
}

static NSString * const kFavoritesArray = @"Fetch.FavoriteDictionary";

-(instancetype)init {
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)addEventToFavorites:(FetchEvent *)event {
    NSMutableArray<NSString *> *favoritesArray = [NSMutableArray<NSString *> arrayWithArray:[_userDefaults objectForKey:kFavoritesArray]];
    if (!favoritesArray) {
        favoritesArray = [NSMutableArray<NSString *> new];
    }
    if (![self eventIsFavorited:event]) {
        [favoritesArray addObject:event.ID];
    }
    [_userDefaults setObject:favoritesArray forKey:kFavoritesArray];
}

-(void)removeEventFromFavorites:(FetchEvent *)event {
    NSMutableArray<NSString *> *favoritesArray = [NSMutableArray<NSString *> arrayWithArray:[_userDefaults objectForKey:kFavoritesArray]];
    if (!favoritesArray) {
        return;
    }
    if ([self eventIsFavorited:event]) {
        [favoritesArray removeObject:event.ID];
    }
    [_userDefaults setObject:favoritesArray forKey:kFavoritesArray];
}

-(BOOL)eventIsFavorited:(FetchEvent *)event {
    NSMutableArray<NSString *> *favoritesArray = [NSMutableArray<NSString *> arrayWithArray:[_userDefaults objectForKey:kFavoritesArray]];
    return [favoritesArray containsObject:event.ID];
}

@end
