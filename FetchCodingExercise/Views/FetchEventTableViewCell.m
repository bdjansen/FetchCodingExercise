//
//  FetchEventTableViewCell.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventTableViewCell.h"
#import "FetchEventViewModel.h"
#import "FetchThemeUtility.h"

static CGFloat const kCellContentIndex = 12;

@implementation FetchEventTableViewCell {
    FetchEventViewModel *_event;
    UIImageView *_favoritedView;
    UILabel *_name;
    UILabel *_location;
    UILabel *_time;
    UIImageView *_thumbnailView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIStackView *stackView = [self _createStackView];
        _name = [self _createNameLabel];
        _location = [self _createLocationLabel];
        _time = [self _createTimeLabel];
        _thumbnailView = [self _createImageView];
        
        [self.contentView addSubview:stackView];
        [stackView.leftAnchor constraintGreaterThanOrEqualToAnchor:self.contentView.leftAnchor constant:kCellContentIndex].active = YES;
        [stackView.topAnchor constraintGreaterThanOrEqualToAnchor:self.contentView.topAnchor constant:kCellContentIndex].active = YES;
        [stackView.rightAnchor constraintLessThanOrEqualToAnchor:self.contentView.rightAnchor constant:-kCellContentIndex].active = YES;
        [stackView.bottomAnchor constraintLessThanOrEqualToAnchor:self.contentView.bottomAnchor constant:-kCellContentIndex].active = YES;
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_thumbnailView];
        [_thumbnailView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:kCellContentIndex].active = YES;
        [_thumbnailView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:kCellContentIndex].active = YES;
        [_thumbnailView.rightAnchor constraintLessThanOrEqualToAnchor:self.contentView.rightAnchor constant:-kCellContentIndex].active = YES;
        [_thumbnailView.bottomAnchor constraintLessThanOrEqualToAnchor:self.contentView.bottomAnchor constant:-kCellContentIndex].active = YES;
        [_thumbnailView.topAnchor constraintEqualToAnchor:stackView.topAnchor].active = YES;
        [_thumbnailView.rightAnchor constraintEqualToAnchor:stackView.leftAnchor constant:-kCellContentIndex].active = YES;
        _thumbnailView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [stackView addArrangedSubview:_name];
        [stackView addArrangedSubview:_location];
        [stackView addArrangedSubview:_time];
    }
    return self;
}

-(void)setEvent:(FetchEventViewModel *)event {
    _event = event;
    _name.text = _event.name;
    _location.text = _event.location;
    _time.text = _event.displayTime;
}

-(void)setThumbnail:(UIImage *)thumbnail {
    _thumbnail = thumbnail;
    _thumbnailView.image = thumbnail;
}

-(FetchEventViewModel *)event {
    return _event;
}

-(void)_addBackgroundView {
    
}

-(UIStackView *)_createStackView {
    UIStackView *infoStackView = [UIStackView new];
    infoStackView.axis = UILayoutConstraintAxisVertical;
    infoStackView.distribution = UIStackViewDistributionEqualSpacing;
    infoStackView.alignment = UIStackViewAlignmentLeading;
    infoStackView.spacing = kCellContentIndex;
    infoStackView.backgroundColor = UIColor.whiteColor;
    return infoStackView;
}

-(UILabel *)_createNameLabel {
    UILabel *name = [UILabel new];
    name.numberOfLines = 0;
    name.text = _event.name;
    name.font = [name.font fontWithSize:24];
    return name;
}

-(UILabel *)_createTimeLabel {
    UILabel *time = [UILabel new];
    time.numberOfLines = 0;
    time.font = [time.font fontWithSize:18];
    time.textColor = UIColor.grayColor;
    return time;
}

-(NSDateFormatter *)_eventFormatter {
    NSDateFormatter *formatter = [FetchThemeUtility FetchEventDateFormatter];
    return formatter;
}

-(UILabel *)_createLocationLabel {
    UILabel *location = [UILabel new];
    location.numberOfLines = 0;
    location.text = _event.location;
    location.font = [location.font fontWithSize:18];
    location.textColor = UIColor.grayColor;
    return location;
}

-(UIImageView *)_createImageView {
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = UIColor.blueColor;
    imageView.layer.cornerRadius = 10;
    imageView.clipsToBounds = YES;
    [imageView.heightAnchor constraintEqualToConstant:80].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:80].active = YES;
    return imageView;
}

@end
