//
//  FetchEventTableViewController.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FetchEventViewModel;

@interface FetchEventTableViewController : UITableViewController

-(instancetype)initWithEvents:(NSArray<FetchEventViewModel *> *)events;

@end

NS_ASSUME_NONNULL_END
