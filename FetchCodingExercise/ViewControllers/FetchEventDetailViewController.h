//
//  FetchEventDetailViewController.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FetchEventViewModel;

@interface FetchEventDetailViewController : UIViewController

-(instancetype)initWithEvent:(FetchEventViewModel *)event;

@end

NS_ASSUME_NONNULL_END
