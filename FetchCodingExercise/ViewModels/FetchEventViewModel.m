//
//  FetchEventViewModel.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventViewModel.h"
#import "FetchThemeUtility.h"
#import "FetchEvent.h"
#import "FetchFavoriteEventsManager.h"

@implementation FetchEventViewModel {
    FetchEvent *_event;
    FetchFavoriteEventsManager *_favoritesManager;
    UIImage *_favoritedButton;
    UIImage *_unfavoritedButton;
}

-(instancetype)initWithEvent:(FetchEvent *)event {
    self = [super init];
    if (self) {
        _favoritesManager = [FetchFavoriteEventsManager new];
        _event = event;
        if ([_favoritesManager eventIsFavorited:_event]) {
            _event.favorited = YES;
        }
    }
    return self;
}

-(NSString *)ID {
    return _event.ID;
}

-(NSString *)name {
    return _event.name;
}

-(NSString *)location {
    return _event.location;
}

-(NSString *)displayTime {
    if (_event.timeTBD) {
        NSDateFormatter *timeFormat = [FetchThemeUtility FetchEventDateFormatter];
        NSString *displayTime = [timeFormat stringFromDate:_event.time];
        return displayTime;
    } else {
        return @"Time: TBD";
    }
}

-(NSData *)thumbnail {
    return _event.thumbnail;
}

-(NSData *) image{
    return _event.image;
}


-(BOOL)favorited {
    return _event.favorited;
}

-(void)toggleFavoriteStatus {
    [_event toggleFavoriteStatus];
    [self _updateFavoritesList];
}

-(void)_updateFavoritesList {
    if (_event.favorited) {
        [_favoritesManager addEventToFavorites:_event];
    } else {
        [_favoritesManager removeEventFromFavorites:_event];
    }
}

-(UIImage *)imageForFavoriteStatus {
    return _event.favorited ? [FetchThemeUtility FavoriteButton] : [FetchThemeUtility UnfavoriteButton];
}
@end
