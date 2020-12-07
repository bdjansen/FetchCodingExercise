//
//  FetchRootViewController.m
//  FetchCodingExercise
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchRootViewController.h"
#import "FetchEventTableViewController.h"
#import "SeatGeekLoader.h"
#import "FetchEventViewModel.h"
#import "FetchEvent.h"

@implementation FetchRootViewController

- (void)loadView {
    self.view = [UIView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Fetch Coding Exercise";
    
    NSArray<FetchEventViewModel *> *eventViewModels;
    @try {
        eventViewModels = [self _createEventViewModels];
    } @catch (NSException *e) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error Retrieving events"
                                                                                     message:e.reason
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"OK"
                                                              style:UIAlertActionStyleDefault
                                                            handler:nil];
        [alertController addAction:dismiss];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    FetchEventTableViewController *eventTVC = [[FetchEventTableViewController alloc] initWithEvents:eventViewModels];
    [self _addSearchControllerToEvents:eventTVC];
    [self _displayEventData:eventViewModels withTable:eventTVC];
}

- (NSArray<FetchEventViewModel *> *)_createEventViewModels {
    NSArray<SeatGeekEvent *> *sgEvents = [self _loadSeatGeekData];
    NSArray<FetchEvent *> *fetchEvents = [self _createFetchEventsFromSeatGeekEvents:sgEvents];
    NSArray<FetchEventViewModel *> *viewModelData = [self _createEventViewModelsFromFetchEvents:fetchEvents];
    return viewModelData;
}

- (NSArray<SeatGeekEvent *> *)_loadSeatGeekData {
    SeatGeekLoader *loader = [SeatGeekLoader new];
    NSArray<SeatGeekEvent *> *sgEvents = [loader getEventData];
    return sgEvents;
}

- (NSArray<FetchEvent *> *)_createFetchEventsFromSeatGeekEvents:(NSArray<SeatGeekEvent *> *)sgEvents {
    NSAssert(sgEvents != nil, @"SeatGeek data needs to be created before making fetch events.");
    NSMutableArray<FetchEvent *> *fetchEvents = [NSMutableArray<FetchEvent *> new];
    for (SeatGeekEvent *sgEvent in sgEvents) {
        FetchEvent *event = [[FetchEvent alloc] initWithSGEvent:sgEvent];
        [fetchEvents addObject:event];
    }
    return fetchEvents;
}

- (NSArray<FetchEventViewModel *> *)_createEventViewModelsFromFetchEvents:(NSArray<FetchEvent *> *)events {
    NSAssert(events != nil, @"Fetch event data needs to be created before making view models.");
    NSMutableArray<FetchEventViewModel *> *fetchEventsVM = [NSMutableArray<FetchEventViewModel *> new];
    for (FetchEvent *event in events) {
        FetchEventViewModel *eventVM = [[FetchEventViewModel alloc] initWithEvent:event];
        [fetchEventsVM addObject:eventVM];
    }
    return fetchEventsVM;
}

-(void)_addSearchControllerToEvents:(FetchEventTableViewController *)eventTVC {
    NSAssert(eventTVC != nil, @"Our table should be created when we add our search controller.");
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = eventTVC;
    searchController.obscuresBackgroundDuringPresentation = NO;
    searchController.searchBar.placeholder = @"Search Events";
    self.navigationItem.searchController = searchController;
    self.navigationController.definesPresentationContext = NO;
}

- (void)_displayEventData:(NSArray<FetchEventViewModel *> *)eventViewModels withTable:(FetchEventTableViewController *)eventTVC {
    NSAssert(eventViewModels != nil, @"Fetch event view models should not be nil.");
    NSAssert(eventTVC != nil, @"Our table should be created when we display the events.");
    eventTVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:eventTVC];
    [self.view addSubview:eventTVC.view];
}

@end
