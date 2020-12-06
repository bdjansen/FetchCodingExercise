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
@end
