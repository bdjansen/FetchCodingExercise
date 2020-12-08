//
//  FetchEventDetailViewController.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventDetailViewController.h"
#import "FetchEventDetailView.h"

@implementation FetchEventDetailViewController {
    FetchEventViewModel *_event;
}

-(instancetype)initWithEvent:(FetchEventViewModel *)event {
    self = [super init];
    if (self) {
        _event = event;
    }
    return self;
}

-(void)loadView {
    [self _displayDetailedView];
    [self _addFavoriteButton];
}

-(void)_displayDetailedView {
    FetchEventDetailView *eventView = [[FetchEventDetailView alloc] initWithEvent:_event];
    UIImage *image = [UIImage imageWithData:_event.image];
    [eventView setImage:image];
    self.view = eventView;
}

-(void)_addFavoriteButton {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[_event imageForFavoriteStatus] style:UIBarButtonItemStylePlain target:self action:@selector(_toggleFavoriteStatus)];
    self.navigationItem.rightBarButtonItem = button;
}

-(void)_toggleFavoriteStatus {
    [_event toggleFavoriteStatus];
    self.navigationItem.rightBarButtonItem.image = [_event imageForFavoriteStatus];
}

@end
