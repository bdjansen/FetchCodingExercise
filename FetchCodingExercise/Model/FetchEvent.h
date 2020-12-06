//
//  FetchEvent.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>
#import "SeatGeeksEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchEvent : NSObject

@property (nonatomic, readonly) NSString *ID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly) NSURL *thumbnail;
@property (nonatomic, readonly) NSURL *image;
@property (nonatomic) BOOL favorited;

-(instancetype)initWithSGEvent:(SeatGeeksEvent *)event;

@end

NS_ASSUME_NONNULL_END
