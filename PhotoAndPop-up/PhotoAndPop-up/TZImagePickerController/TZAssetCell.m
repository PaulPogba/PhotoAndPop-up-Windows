//
//  TZAssetCell.m
//  TZImagePickerController
//
//  Created by 谭真 on 15/12/24.
//  Copyright © 2015年 谭真. All rights reserved.
//

#import "TZAssetCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZImagePickerController.h"

@interface TZAssetCell ()
@property (weak, nonatomic) UIImageView *imageView;       // The photo / 照片
@property (weak, nonatomic) UIImageView *selectImageView;
@property (weak, nonatomic) UIView *bottomView;
@property (weak, nonatomic) UILabel *timeLength;
@property (weak, nonatomic) UIView *grayView;       //照片图层
@property (nonatomic, weak) UIImageView *viewImgView;

@end

@implementation TZAssetCell

// Now we use code to create subViews for improve performance
// 现在我们用代码来创建TZAssetCell和TZAlbumCell的子控件，以提高性能

/*
- (void)awakeFromNib {
    self.timeLength.font = [UIFont boldSystemFontOfSize:11];
}
 */

- (void)setModel:(TZAssetModel *)model {
    _model = model;
    [[TZImageManager manager] getPhotoWithAsset:model.asset photoWidth:self.tz_width completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
        self.imageView.image = photo;
    }];
    self.grayView.backgroundColor = self.selectPhotoButton.isSelected ? [[UIColor blackColor] colorWithAlphaComponent:0.4] : [UIColor clearColor];

    self.selectPhotoButton.selected = model.isSelected;
    self.selectImageView.image = self.selectPhotoButton.isSelected ? imageNamed(@"icon_login_sel_photo_picker") :imageNamed(@"icon_login_photo_picker");
    self.type = TZAssetCellTypePhoto;
    if (model.type == TZAssetModelMediaTypeLivePhoto)      self.type = TZAssetCellTypeLivePhoto;
    else if (model.type == TZAssetModelMediaTypeAudio)     self.type = TZAssetCellTypeAudio;
    else if (model.type == TZAssetModelMediaTypeVideo) {
        self.type = TZAssetCellTypeVideo;
        self.timeLength.text = model.timeLength;
    }
}

- (void)setType:(TZAssetCellType)type {
    _type = type;
    if (type == TZAssetCellTypePhoto || type == TZAssetCellTypeLivePhoto) {
        _selectImageView.hidden = NO;
        _selectPhotoButton.hidden = NO;
        _bottomView.hidden = YES;
    } else {
        _selectImageView.hidden = YES;
        _selectPhotoButton.hidden = YES;
        _bottomView.hidden = NO;
    }
}

- (void)selectPhotoButtonClick:(UIButton *)sender {
    if (self.didSelectPhotoBlock) {
        self.didSelectPhotoBlock(sender.isSelected);
    }
    self.selectImageView.image = sender.isSelected ?imageNamed(@"icon_login_sel_photo_picker"): imageNamed(@"icon_login_photo_picker");
     self.grayView.backgroundColor = self.selectPhotoButton.isSelected ? [[UIColor blackColor] colorWithAlphaComponent:0.4] : [UIColor clearColor];
    if (sender.isSelected) {
        [UIView showOscillatoryAnimationWithLayer:_selectImageView.layer type:TZOscillatoryAnimationToBigger];
    }
}

#pragma mark - Lazy load 
- (UIView *)grayView
{
    if (!_grayView) {
        UIView *grayView = [[UIView alloc] init];
        grayView.frame = CGRectMake(0, 0, self.tz_width, self.tz_height);
        grayView.contentMode = UIViewContentModeScaleAspectFill;
        grayView.clipsToBounds = YES;
        [self.contentView addSubview:grayView];
        _grayView = grayView;
        
    }
    return  _grayView;
}
- (UIButton *)selectPhotoButton {
    if (_selectImageView == nil) {
        UIButton *selectImageView = [[UIButton alloc] init];
        selectImageView.frame = CGRectMake(self.tz_width - 44, 0, 44, 44);
        [selectImageView addTarget:self action:@selector(selectPhotoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:selectImageView];
        _selectPhotoButton = selectImageView;
    }
    return _selectPhotoButton;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, self.tz_width, self.tz_height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        UIImage *image = imageNamed(@"icon_login_sel_photo_picker");
        UIImageView *selectImageView = [[UIImageView alloc] init];
        selectImageView.frame = CGRectMake(self.tz_width - image.size.width - MARGIN_5, MARGIN_5, image.size.width, image.size.height);
        [self.contentView addSubview:selectImageView];
        _selectImageView = selectImageView;
    }
    return _selectImageView;
}

- (UIView *)bottomView {
    if (_bottomView == nil) {
        UIView *bottomView = [[UIView alloc] init];
        bottomView.frame = CGRectMake(0, self.tz_height - 17, self.tz_width, 17);
        bottomView.backgroundColor = [UIColor blackColor];
        bottomView.alpha = 0.8;
        [self.contentView addSubview:bottomView];
        _bottomView = bottomView;
    }
    return _bottomView;
}

- (UIImageView *)viewImgView {
    if (_viewImgView == nil) {
        UIImageView *viewImgView = [[UIImageView alloc] init];
        viewImgView.frame = CGRectMake(8, 0, 17, 17);
        [viewImgView setImage:imageNamed(@"VideoSendIcon")];
        [self.bottomView addSubview:viewImgView];
        _viewImgView = viewImgView;
    }
    return _viewImgView;
}

- (UILabel *)timeLength {
    if (_timeLength == nil) {
        UILabel *timeLength = [[UILabel alloc] init];
        timeLength.font = [UIFont boldSystemFontOfSize:11];
        timeLength.frame = CGRectMake(self.viewImgView.tz_right, 0, self.tz_width - self.viewImgView.tz_right - 5, 17);
        timeLength.textColor = [UIColor whiteColor];
        timeLength.textAlignment = NSTextAlignmentRight;
        [self.bottomView addSubview:timeLength];
        _timeLength = timeLength;
    }
    return _timeLength;
}

@end

@interface TZAlbumCell ()
@property (weak, nonatomic) UIImageView *posterImageView;
@property (weak, nonatomic) UILabel *titleLable;
@property (weak, nonatomic) UIImageView *arrowImageView;
@end

@implementation TZAlbumCell

/*
- (void)awakeFromNib {
    self.posterImageView.clipsToBounds = YES;
}
 */

- (void)setModel:(TZAlbumModel *)model {
    _model = model;
    
    NSMutableAttributedString *nameString = [[NSMutableAttributedString alloc] initWithString:model.name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor blackColor]}];
    NSAttributedString *countString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  (%zd)",model.count] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
    [nameString appendAttributedString:countString];
    self.titleLable.attributedText = nameString;
    [[TZImageManager manager] getPostImageWithAlbumModel:model completion:^(UIImage *postImage) {
        self.posterImageView.image = postImage;
    }];
    if (model.selectedCount) {
        self.selectedCountButton.hidden = NO;
        [self.selectedCountButton setTitle:[NSString stringWithFormat:@"%zd",model.selectedCount] forState:UIControlStateNormal];
    } else {
        self.selectedCountButton.hidden = YES;
    }
}

/// For fitting iOS6
- (void)layoutSubviews {
    if (iOS7Later) [super layoutSubviews];
    _selectedCountButton.frame = CGRectMake(self.tz_width - 24 - 30, 23, 24, 24);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    if (iOS7Later) [super layoutSublayersOfLayer:layer];
}

#pragma mark - Lazy load

- (UIImageView *)posterImageView {
    if (_arrowImageView == nil) {
        UIImageView *posterImageView = [[UIImageView alloc] init];
        posterImageView.contentMode = UIViewContentModeScaleAspectFill;
        posterImageView.clipsToBounds = YES;
        posterImageView.frame = CGRectMake(0, 0, 70, 70);
        [self.contentView addSubview:posterImageView];
        _posterImageView = posterImageView;
    }
    return _posterImageView;
}

- (UILabel *)titleLable {
    if (_titleLable == nil) {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.font = [UIFont boldSystemFontOfSize:17];
        titleLable.frame = CGRectMake(80, 0, self.tz_width - 80 - 50, self.tz_height);
        titleLable.textColor = [UIColor blackColor];
        titleLable.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:titleLable];
        _titleLable = titleLable;
    }
    return _titleLable;
}

- (UIImageView *)arrowImageView {
    if (_arrowImageView == nil) {
        UIImageView *arrowImageView = [[UIImageView alloc] init];
        CGFloat arrowWH = 15;
        arrowImageView.frame = CGRectMake(self.tz_width - arrowWH - 12, 28, arrowWH, arrowWH);
        [arrowImageView setImage:imageNamed(@"TableViewArrow")];
        [self.contentView addSubview:arrowImageView];
        _arrowImageView = arrowImageView;
    }
    return _arrowImageView;
}

- (UIButton *)selectedCountButton {
    if (_selectedCountButton == nil) {
        UIButton *selectedCountButton = [[UIButton alloc] init];
        selectedCountButton.layer.cornerRadius = 12;
        selectedCountButton.clipsToBounds = YES;
        selectedCountButton.backgroundColor = [UIColor blackColor];
        [selectedCountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        selectedCountButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:selectedCountButton];
        _selectedCountButton = selectedCountButton;
    }
    return _selectedCountButton;
}

@end



@implementation TZAssetCameraCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}

@end
