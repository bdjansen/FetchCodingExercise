//
//  SeatGeekLoader.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import "SeatGeekLoader.h"
#import "SeatGeekEvent.h"
#import "FetchThemeUtility.h"

@implementation SeatGeekLoader

static NSString *const secret = @"ed130ff7caaa99fa8eced9454740cf6194b39f0b3c3e7a714c18076e42096650";
static NSString *const clientID = @"MjE0MjA3NjN8MTYwNzIxMDc1Ny44NjUxMTQ";

- (NSArray<SeatGeekEvent *> *)getEventData {
    NSData *serverData = [self _loadEventDataFromSeatGeek];
    NSArray<SeatGeekEvent *> *eventData = [self _parseSeatGeekData:serverData];
    return eventData;
}

- (NSData *)_loadEventDataFromSeatGeek {
    NSString *urlString = [NSString stringWithFormat:@"https://api.seatgeek.com/2/events?client_id=%@&client_secret=%@",clientID,secret];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlString]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSException *serverException = [[NSException alloc] initWithName:@"Server Error" reason:[NSString stringWithFormat:@"Trying to get events returned error code: %li", responseCode.statusCode] userInfo:nil];
        @throw serverException;
        return nil;
    }

    return oResponseData;
}

-(NSArray<SeatGeekEvent *> *)_parseSeatGeekData:(NSData *)data {
    NSAssert(data != nil, @"Do not try to parse data that does not exist.");
    NSMutableArray<SeatGeekEvent *> *events = [NSMutableArray<SeatGeekEvent *> new];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray<NSDictionary *> *eventsArray = [json objectForKey:@"events"];
    
    for (NSDictionary *eventDict in eventsArray) {
        SeatGeekEvent *event = [self _createSGEventFromEventDictionary:eventDict];
        [events addObject:event];
    }
    
    return events;
}

-(SeatGeekEvent *)_createSGEventFromEventDictionary:(NSDictionary *)eventDict {
    NSAssert(eventDict != nil, @"Do not try to create an event from empty data");
    NSString *title = eventDict[@"title"];
    NSString *eventID = eventDict[@"id"];
    NSDate *time = [self _getTimeFromEvent:eventDict];
    NSString *location = [self _getLocationFromEvent:eventDict];
    //TODO: Get photos from URL
    NSURL *thumbnailURL = [self _getThumbnailFromEvent:eventDict];
    NSURL *imageURL = [self _getImageFromEvent:eventDict];
    NSData *thumbnail = [[NSData alloc] initWithContentsOfURL:thumbnailURL];
    NSData *image = [[NSData alloc] initWithContentsOfURL:imageURL];
    
    SeatGeekEvent *event = [[SeatGeekEvent alloc] initWithID:eventID name:title location:location time:time thumbnail:thumbnail image:image timeTBD:NO];
    return event;
}

- (NSURL *)_getThumbnailFromEvent:(NSDictionary *)eventDict {
    NSArray *performers = eventDict[@"performers"];
    NSDictionary *firstPerformerData = performers[0];
    return [NSURL URLWithString:firstPerformerData[@"image"]];
}

- (NSURL *)_getImageFromEvent:(NSDictionary *)eventDict {
    NSArray *performers = eventDict[@"performers"];
    NSDictionary *firstPerformerData = performers[0];
    return [NSURL URLWithString:firstPerformerData[@"image"]];
}

- (NSDate *)_getTimeFromEvent:(NSDictionary *)eventDict {
    NSString *time = eventDict[@"datetime_local"];
    NSDateFormatter *formatter = FetchThemeUtility.SeatGeekEventDateFormatter;
    NSDate *date = [formatter dateFromString:time];
    return date;
}

-(NSString *)_getLocationFromEvent:(NSDictionary *)eventDict {
    NSDictionary *venueData = eventDict[@"venue"];
    return venueData[@"display_location"];
}

@end
