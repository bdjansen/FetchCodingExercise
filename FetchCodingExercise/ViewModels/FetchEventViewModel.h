//
//  FetchEventViewModel.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FetchEvent;

@interface FetchEventViewModel : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSString *displayTime;
@property (nonatomic, readonly) NSURL *thumbnail;
@property (nonatomic, readonly) NSURL *image;
@property (nonatomic, readonly) BOOL favorited;

-(instancetype)initWithEvent:(FetchEvent *)event;
-(void)toggleFavoriteStatus;

@end

NS_ASSUME_NONNULL_END
