//
//  FetchEventDetailViewController.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventDetailViewController.h"
#import "FetchEventDetailView.h"
#import "FetchEventViewModel.h"

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
    FetchEventDetailView *eventView = [[FetchEventDetailView alloc] initWithEvent:_event];
    self.view = eventView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
