//
//  FetchEventTableViewController.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventTableViewController.h"
#import "FetchEventTableViewCell.h"
#import "FetchEventDetailViewController.h"

@interface FetchEventTableViewController ()

@end

// Constants
static NSString *const kCellIdentifier = @"EventCell";

@implementation FetchEventTableViewController {
    NSArray<FetchEventViewModel *> *_events;
    NSArray<FetchEventViewModel *> *_filteredEvents;
}

-(instancetype)initWithEvents:(NSArray<FetchEventViewModel *> *)events {
    self = [super init];
    if (self) {
        _events = events;
        _filteredEvents = @[];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:FetchEventTableViewCell.class forCellReuseIdentifier:kCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_filteredEvents.count) {
        return _filteredEvents.count;
    }
        
    return _events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FetchEventViewModel *event;
    if (_filteredEvents.count) {
        event = _filteredEvents[indexPath.row];
    } else {
        event = _events[indexPath.row];
    }
    
    UIImage *thumbnail = [UIImage imageWithData: event.thumbnail];
    
    FetchEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.event = event;
    cell.thumbnail = thumbnail;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FetchEventDetailViewController *eventDetailVC = [[FetchEventDetailViewController alloc] initWithEvent:_events[indexPath.row]];
    [self.navigationController pushViewController:eventDetailVC animated:YES];
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSMutableArray *array = [NSMutableArray new];
    for (FetchEventViewModel *event in _events) {
        if ([event.name.lowercaseString containsString:searchController.searchBar.text.lowercaseString]) {
            [array addObject:event];
        }
    }
    
    if (searchController.isActive && searchController.searchBar.text.length) {
        _filteredEvents = array;
    } else {
        _filteredEvents = @[];
    }
    
    [self.tableView reloadData];
}

@end
