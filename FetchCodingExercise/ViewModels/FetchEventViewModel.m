//
//  FetchEventViewModel.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventViewModel.h"
#import "FetchThemeUtility.h"
#import "FetchEvent.h"

@implementation FetchEventViewModel {
    FetchEvent *_event;
}

-(instancetype)initWithEvent:(FetchEvent *)event {
    self = [super init];
    if (self) {
        _event = event;
    }
    return self;
}

-(NSString *)name {
    return _event.name;
}

-(NSString *)location {
    return _event.location;
}

-(NSString *)displayTime {
    NSDateFormatter *timeFormat = [FetchThemeUtility FetchEventDateFormatter];
    NSString *displayTime = [timeFormat stringFromDate:_event.time];
    return displayTime;
}

-(NSURL *)thumbnail {
    return _event.thumbnail;
}

-(NSURL *) image{
    return _event.image;
}


-(BOOL)favorited {
    return _event.favorited;
}

-(void)toggleFavoriteStatus {
    _event.favorited = !_event.favorited;
}

@end
