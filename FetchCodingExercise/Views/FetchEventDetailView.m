//
//  UIFetchEventDetailView.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventDetailView.h"
#import "FetchEventViewModel.h"

@implementation FetchEventDetailView {
    FetchEventViewModel *_event;
    UIView *_backgroundView;
    UIImageView *_imageView;
}

-(instancetype)initWithEvent:(FetchEventViewModel *)event {
    self = [super init];
    if (self) {
        _event = event;
        self.backgroundColor = UIColor.whiteColor;
        
        [self _createBackgroundView];
        UIStackView *stackView = [self _createStackView];
        UILabel *name = [self _createNameLabel];
        UILabel *location = [self _createLocationLabel];
        UILabel *time = [self _createTimeLabel];
        UIView *separatorView = [self _createSeparatorView];
       _imageView = [self _createImageView];
        
        [self _addBackgroundView];
        
        [_backgroundView addSubview:stackView];
        [stackView.heightAnchor constraintEqualToAnchor:_backgroundView.heightAnchor constant:-16].active = YES;
        [stackView.widthAnchor constraintEqualToAnchor:_backgroundView.widthAnchor constant:-16].active = YES;
        [stackView.centerXAnchor constraintEqualToAnchor:_backgroundView.centerXAnchor].active = YES;
        [stackView.centerYAnchor constraintEqualToAnchor:_backgroundView.centerYAnchor].active = YES;
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [stackView addArrangedSubview:name];
        [stackView addArrangedSubview:separatorView];
        [stackView addArrangedSubview:_imageView];
        [stackView addArrangedSubview:time];
        [stackView addArrangedSubview:location];
        
        [_imageView.widthAnchor constraintEqualToAnchor:stackView.widthAnchor].active = YES;
        [separatorView.widthAnchor constraintEqualToAnchor:stackView.widthAnchor].active = YES;
    }
    return self;
}

-(void)_createBackgroundView {
    _backgroundView = [UIView new];
    _backgroundView.backgroundColor = UIColor.whiteColor;
}

-(void)_addBackgroundView {
    [self addSubview:_backgroundView];
    [_backgroundView.leftAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leftAnchor].active = YES;
    [_backgroundView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
    [_backgroundView.rightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.rightAnchor].active = YES;
    [_backgroundView.bottomAnchor constraintLessThanOrEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = YES;
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void)setImage:(UIImage *)image {
    _imageView.image = image;
}

-(UIStackView *)_createStackView {
    UIStackView *infoStackView = [UIStackView new];
    infoStackView.axis = UILayoutConstraintAxisVertical;
    infoStackView.distribution = UIStackViewDistributionEqualSpacing;
    infoStackView.alignment = UIStackViewAlignmentLeading;
    infoStackView.spacing = 12;
    infoStackView.backgroundColor = UIColor.whiteColor;
    return infoStackView;
}

-(UILabel *)_createNameLabel {
    UILabel *name = [UILabel new];
    name.numberOfLines = 0;
    name.text = _event.name;
    name.font = [name.font fontWithSize:30];
    return name;
}

-(UILabel *)_createTimeLabel {
    UILabel *time = [UILabel new];
    time.numberOfLines = 0;
    time.text = _event.displayTime;
    time.font = [time.font fontWithSize:25];
    return time;
}

-(NSDateFormatter *)_eventFormatter {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    formatter.dateFormat = @"MM-dd-YYYY HH:mm:SS";
    return formatter;
}

-(UILabel *)_createLocationLabel {
    UILabel *location = [UILabel new];
    location.numberOfLines = 0;
    location.text = _event.location;
    location.font = [location.font fontWithSize:20];
    location.textColor = UIColor.grayColor;
    return location;
}

-(UIView *)_createSeparatorView {
    UIView *separatorView = [UIView new];
    separatorView.backgroundColor = UIColor.grayColor;
    separatorView.layer.cornerRadius = 5;
    [separatorView.heightAnchor constraintEqualToConstant:2].active = YES;
    return separatorView;
}

-(UIImageView *)_createImageView {
    UIImageView *separatorView = [UIImageView new];
    separatorView.backgroundColor = UIColor.blueColor;
    separatorView.layer.cornerRadius = 5;
    [separatorView.heightAnchor constraintGreaterThanOrEqualToConstant:50].active = YES;
    return separatorView;
}
@end
