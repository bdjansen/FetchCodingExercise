//
//  SGEvent.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeatGeekEvent : NSObject

-(instancetype)initWithID:(NSString *)ID name:(NSString *)name location:(NSString *)location time:(NSDate *)time thumbnail:(NSData *)thumbnail image:(NSData *)image timeTBD:(BOOL)timeTBD;

@property (nonatomic, readonly) NSString *ID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly) NSData *thumbnail;
@property (nonatomic, readonly) NSData *image;
@property (nonatomic, readonly) BOOL timeTBD;

@end

NS_ASSUME_NONNULL_END
