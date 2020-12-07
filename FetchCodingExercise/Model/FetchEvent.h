//
//  FetchEvent.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>
#import "SeatGeekEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchEvent : NSObject

@property (nonatomic, readonly) NSString *ID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly) NSData *thumbnail;
@property (nonatomic, readonly) NSData *image;
@property (nonatomic) BOOL favorited;
@property (nonatomic) BOOL timeTBD;

-(instancetype)initWithSGEvent:(SeatGeekEvent *)event;
-(void)toggleFavoriteStatus;

@end

NS_ASSUME_NONNULL_END
