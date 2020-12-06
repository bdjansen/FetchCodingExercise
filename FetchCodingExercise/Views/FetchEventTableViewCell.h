//
//  FetchEventTableViewCell.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FetchEventViewModel;

@interface FetchEventTableViewCell : UITableViewCell

@property (nonatomic) FetchEventViewModel *event;
@property (nonatomic) UIImage *thumbnail;

@end

NS_ASSUME_NONNULL_END
