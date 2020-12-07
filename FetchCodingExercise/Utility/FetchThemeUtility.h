//
//  FetchThemeUtility.h
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FetchThemeUtility : NSObject

+(NSDateFormatter *)SeatGeekEventDateFormatter;
+(NSDateFormatter *)FetchEventDateFormatter;
+(UIImage *)FavoriteButton;
+(UIImage *)UnfavoriteButton;

+(UILabel *)DetailViewTitle;
+(UILabel *)DetailViewSubtitle;
+(UILabel *)CellTitle;
+(UILabel *)CellSubtitle;

@end

NS_ASSUME_NONNULL_END
