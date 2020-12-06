//
//  FetchEventTableViewController.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventTableViewController.h"
#import "FetchEventViewModel.h"
#import "FetchEventTableViewCell.h"
#import "FetchEventDetailViewController.h"

@interface FetchEventTableViewController ()

@end

@implementation FetchEventTableViewController {
    NSArray<FetchEventViewModel *> *_events;
}

-(instancetype)initWithEvents:(NSArray<FetchEventViewModel *> *)events {
    self = [super init];
    if (self) {
        _events = events;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FetchEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    
    cell.event = _events[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FetchEventDetailViewController *eventDetailVC = [[FetchEventDetailViewController alloc] initWithEvent:_events[indexPath.row]];
    [self.navigationController pushViewController:eventDetailVC animated:YES];
}

@end
