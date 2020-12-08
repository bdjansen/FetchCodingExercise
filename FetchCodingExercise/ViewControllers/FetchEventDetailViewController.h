//
//  FetchEventDetailViewController.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>
#import "FetchEventViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchEventDetailViewController : UIViewController

-(instancetype)initWithEvent:(FetchEventViewModel *)event;

@end

NS_ASSUME_NONNULL_END
