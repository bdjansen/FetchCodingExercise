//
//  FetchThemeUtility.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchThemeUtility.h"

@implementation FetchThemeUtility

+(NSDateFormatter *)SeatGeekEventDateFormatter {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"YYYY-MM-dd'T'HH:mm:SS";
    return formatter;
}

+(NSDateFormatter *)FetchEventDateFormatter {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"EEEE',' dd MMM YYYY hh:mm a";
    return formatter;
}

+(UIImage *)FavoriteButton {
    return [UIImage imageNamed:@"favorited.png"];
}

+(UIImage *)UnfavoriteButton {
    return [UIImage imageNamed:@"unfavorited.png"];
}

+(UILabel *)DetailViewTitle {
    UILabel *title = [UILabel new];
    title.numberOfLines = 0;
    title.font = [title.font fontWithSize:30];
    return title;
}

+(UILabel *)DetailViewSubtitle {
    UILabel *subtitle = [UILabel new];
    subtitle.numberOfLines = 0;
    subtitle.font = [subtitle.font fontWithSize:20];
    subtitle.textColor = UIColor.grayColor;
    return subtitle;
}

+(UILabel *)CellTitle {
    UILabel *title = [UILabel new];
    title.numberOfLines = 0;
    title.font = [title.font fontWithSize:24];
    return title;
}

+(UILabel *)CellSubtitle {
    UILabel *subtitle = [UILabel new];
    subtitle.numberOfLines = 0;
    subtitle.font = [subtitle.font fontWithSize:18];
    subtitle.textColor = UIColor.grayColor;
    return subtitle;
}
@end
