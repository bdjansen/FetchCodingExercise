//
//  SeatGeekLoader.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import "SeatGeekLoader.h"
#import "SeatGeeksEvent.h"
#import "FetchThemeUtility.h"

@implementation SeatGeekLoader

const NSString *secret = @"ed130ff7caaa99fa8eced9454740cf6194b39f0b3c3e7a714c18076e42096650";
const NSString *clientID = @"MjE0MjA3NjN8MTYwNzIxMDc1Ny44NjUxMTQ";

- (NSArray<SeatGeeksEvent *> *)getEventData {
    NSData *serverData = [self _loadEventDataFromSeatGeekFAKE];
    NSArray<SeatGeeksEvent *> *eventData = [self _parseSeatGeekData:serverData];
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
        NSLog(@"Error getting %@, HTTP status code %i", urlString, [responseCode statusCode]);
        return nil;
    }

    return oResponseData;
}

- (NSData *)_loadEventDataFromSeatGeekFAKE {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FakeDataFile" ofType:nil];
    NSString *dataString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* data = [dataString dataUsingEncoding:NSUTF8StringEncoding];

    return data;
}

-(NSArray<SeatGeeksEvent *> *)_parseSeatGeekData:(NSData *)data {
    NSAssert(data != nil, @"Do not try to parse data that does not exist.");
    NSMutableArray<SeatGeeksEvent *> *events = [NSMutableArray<SeatGeeksEvent *> new];
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray<NSDictionary *> *eventsArray = [json objectForKey:@"events"];
    
    for (NSDictionary *eventDict in eventsArray) {
        SeatGeeksEvent *event = [self _createSGEventFromEventDictionary:eventDict];
        [events addObject:event];
    }
    
    return events;
}

-(SeatGeeksEvent *)_createSGEventFromEventDictionary:(NSDictionary *)eventDict {
    NSAssert(eventDict != nil, @"Do not try to create an event from empty data");
    NSString *title = eventDict[@"title"];
    NSString *eventID = eventDict[@"id"];
    NSDate *time = [self _getTimeFromEvent:eventDict];
    NSString *location = [self _getLocationFromEvent:eventDict];
    //TODO: Get photos from URL
    NSURL *thumbnail = [self _getThumbnailFromEvent:eventDict];
    NSURL *image = [self _getImageFromEvent:eventDict];
    
    SeatGeeksEvent *event = [[SeatGeeksEvent alloc] initWithID:eventID name:title location:location time:time thumbnail:thumbnail image:image];
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
