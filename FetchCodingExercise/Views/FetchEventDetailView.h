//
//  UIFetchEventDetailView.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FetchEventViewModel;

@interface FetchEventDetailView : UIView

- (instancetype)initWithEvent:(FetchEventViewModel *)event;
- (void)setImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
