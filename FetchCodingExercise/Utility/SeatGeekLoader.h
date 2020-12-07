//
//  SeatGeekLoader.h
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>
#import "SeatGeekEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface SeatGeekLoader : NSObject

-(NSArray<SeatGeekEvent *> *)getEventData;

@end

NS_ASSUME_NONNULL_END
