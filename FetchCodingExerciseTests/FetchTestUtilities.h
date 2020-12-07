//
//  FetchTestUtilities.h
//  FetchCodingExerciseTests
//
//  Created by Blake Jansen on 12/6/20.
//

#import <Foundation/Foundation.h>
@class SeatGeekEvent;
@class FetchEvent;
@class FetchEventViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface FetchTestUtilities : NSObject

+(SeatGeekEvent *)EmptySeatGeekEvent;
+(FetchEvent *)EmptyFetchEvent;
+(FetchEventViewModel *)EmptyFetchEvenViewModel;

@end

NS_ASSUME_NONNULL_END
