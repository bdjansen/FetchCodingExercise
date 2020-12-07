//
//  FetchEventTableViewCell.m
//  FetchSeatGeekExercise (iOS)
//
//  Created by Blake Jansen on 12/5/20.
//

#import "FetchEventTableViewCell.h"
#import "FetchEventViewModel.h"
#import "FetchThemeUtility.h"

static CGFloat const kCellContentIndex = 20;
static CGFloat const kThumbnailSize = 80;
static CGFloat const kFavoriteViewSize = 20;
static CGFloat const kTextSpacingSize = 12;

@implementation FetchEventTableViewCell {
    FetchEventViewModel *_event;
    UILabel *_name;
    UILabel *_location;
    UILabel *_time;
    UIImageView *_thumbnailView;
    UIImageView *_favoriteView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIStackView *stackView = [self _createStackView];
        _name = [self _createNameLabel];
        _location = [self _createLocationLabel];
        _time = [self _createTimeLabel];
        _thumbnailView = [self _createImageView];
        _favoriteView = [self _createFavoriteView];
        
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
        
        [self.contentView addSubview:_favoriteView];
        [_favoriteView.leftAnchor constraintEqualToAnchor:_thumbnailView.leftAnchor constant:-kFavoriteViewSize / 2].active = YES;
        [_favoriteView.topAnchor constraintEqualToAnchor:_thumbnailView.topAnchor constant:-kFavoriteViewSize / 3].active = YES;
        _favoriteView.translatesAutoresizingMaskIntoConstraints = NO;
        _favoriteView.hidden = YES;
        
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
    _favoriteView.hidden = !_event.favorited;
}

-(void)setThumbnail:(UIImage *)thumbnail {
    _thumbnail = thumbnail;
    _thumbnailView.image = thumbnail;
}

-(FetchEventViewModel *)event {
    return _event;
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
    return [FetchThemeUtility CellTitle];
}

-(UILabel *)_createTimeLabel {
    return [FetchThemeUtility CellSubtitle];
}

-(UILabel *)_createLocationLabel {
    return [FetchThemeUtility CellSubtitle];
}

-(UIImageView *)_createImageView {
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = UIColor.blueColor;
    imageView.layer.cornerRadius = 10;
    imageView.clipsToBounds = YES;
    [imageView.heightAnchor constraintEqualToConstant:kThumbnailSize].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:kThumbnailSize].active = YES;
    return imageView;
}

-(UIImageView *)_createFavoriteView {
    UIImageView *imageView = [UIImageView new];
    imageView.layer.cornerRadius = 10;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"favorited.png"];
    [imageView.heightAnchor constraintEqualToConstant:kFavoriteViewSize].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:kFavoriteViewSize].active = YES;
    return imageView;
}

@end
