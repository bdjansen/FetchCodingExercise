//
//  FetchTestUtilities.m
//  FetchCodingExerciseTests
//
//  Created by Blake Jansen on 12/6/20.
//

#import "FetchTestUtilities.h"
#import "FetchEvent.h"
#import "FetchEventViewModel.h"

@implementation FetchTestUtilities

+(SeatGeekEvent *)EmptySeatGeekEvent {
    SeatGeekEvent *event = [[SeatGeekEvent alloc] initWithID:@"Fake ID" name:@"Fake Title" location:@"Fake Location" time:NSDate.now thumbnail:[NSData new] image:[NSData new]];
    
    return event;
}

+(FetchEvent *)EmptyFetchEvent {
    SeatGeekEvent *sgEvent = [FetchTestUtilities EmptySeatGeekEvent];
    FetchEvent *event = [[FetchEvent alloc] initWithSGEvent:sgEvent];
    return event;
}

+(FetchEventViewModel *)EmptyFetchEvenViewModel {
    FetchEvent *fetchEvent = [FetchTestUtilities EmptyFetchEvent];
    FetchEventViewModel *event = [[FetchEventViewModel alloc] initWithEvent:fetchEvent];
    return event;
}

@end
