//
//  SGEvent.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "SeatGeekEvent.h"

@implementation SeatGeekEvent

-(instancetype)initWithID:(NSString *)ID name:(NSString *)name location:(NSString *)location time:(NSDate *)time thumbnail:(NSData *)thumbnail image:(NSData *)image timeTBD:(BOOL)timeTBD {
    self = [super init];
    if (self) {
        _ID = ID;
        _name = name;
        _location = location;
        _time = time;
        _thumbnail = thumbnail;
        _image = image;
        _timeTBD = timeTBD;
    }
    return self;
}

@end
