//
//  UIFetchEventDetailView.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventDetailView.h"
#import "FetchEventViewModel.h"
#import "FetchThemeUtility.h"

static CGFloat const kCellContentIndex = 8;
static CGFloat const kTextSpacingSize = 12;
static CGFloat const kCornerRadius = 5;

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
        [stackView.heightAnchor constraintEqualToAnchor:_backgroundView.heightAnchor constant:-2 * kCellContentIndex].active = YES;
        [stackView.widthAnchor constraintEqualToAnchor:_backgroundView.widthAnchor constant:-2 * kCellContentIndex].active = YES;
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
    infoStackView.spacing = kTextSpacingSize;
    infoStackView.backgroundColor = UIColor.whiteColor;
    return infoStackView;
}

-(UILabel *)_createNameLabel {
    UILabel *name = [FetchThemeUtility DetailViewTitle];
    name.text = _event.name;
    return name;
}

-(UILabel *)_createTimeLabel {
    UILabel *time = [FetchThemeUtility DetailViewSubtitle];
    time.textColor = UIColor.blackColor;
    time.text = _event.displayTime;
    return time;
}

-(UILabel *)_createLocationLabel {
    UILabel *location = [FetchThemeUtility DetailViewSubtitle];
    location.text = _event.location;
    return location;
}

-(UIView *)_createSeparatorView {
    UIView *separatorView = [UIView new];
    separatorView.backgroundColor = UIColor.lightGrayColor;
    separatorView.layer.cornerRadius = kCornerRadius;
    [separatorView.heightAnchor constraintEqualToConstant:2].active = YES;
    return separatorView;
}

-(UIImageView *)_createImageView {
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = UIColor.blueColor;
    imageView.layer.cornerRadius = kCornerRadius;
    imageView.clipsToBounds = YES;
    [imageView.heightAnchor constraintGreaterThanOrEqualToConstant:50].active = YES;
    return imageView;
}
@end
