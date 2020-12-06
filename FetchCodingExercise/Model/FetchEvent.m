//
//  FetchEvent.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEvent.h"

@implementation FetchEvent

-(instancetype)initWithSGEvent:(SeatGeeksEvent *)event {
    self = [super init];
    if (self) {
        _ID = event.ID;
        _name = event.name;
        _location = event.location;
        _time = event.time;
        _thumbnail = event.thumbnail;
        _image = event.image;
        _favorited = NO;
    }
    return self;
}

-(void)toggleFavoriteStatus {
    _favorited = !_favorited;
}

@end
