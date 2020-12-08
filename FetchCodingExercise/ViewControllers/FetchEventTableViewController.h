//
//  FetchEventTableViewController.h
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import <UIKit/UIKit.h>
#import "FetchEventViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchEventTableViewController : UITableViewController <UISearchResultsUpdating>

-(instancetype)initWithEvents:(NSArray<FetchEventViewModel *> *)events;

@end

NS_ASSUME_NONNULL_END
