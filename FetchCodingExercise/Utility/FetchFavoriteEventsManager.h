//
//  FetchFavoriteEventsManager.h
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/6/20.
//

#import <Foundation/Foundation.h>
#import "FetchEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchFavoriteEventsManager : NSObject

-(void)addEventToFavorites:(FetchEvent *)event;
-(void)removeEventFromFavorites:(FetchEvent *)event;
-(BOOL)eventIsFavorited:(FetchEvent *)event;

@end

NS_ASSUME_NONNULL_END
