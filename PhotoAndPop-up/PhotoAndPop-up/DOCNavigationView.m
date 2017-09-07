//
//  DOCNavigationView.m
//  docClient
//
//  Created by nuhgroup on 2017/7/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "DOCNavigationView.h"


#define ITEM_WIDHT 60
#define ITEM_HEIHT 64

@implementation DOCNavigationView

- (id)initWithLeftAction: (void (^)(UIButton *leftItem)) leftAction rightAction:(void(^)(UIButton *rightItem)) rightAction right1Action:(void(^)(UIButton *rightItem1)) right1Action{
    if (self = [super init]) {
        
        WEAKSELF
        
        self.onLeftAction = leftAction;
        self.onRightAction = rightAction;
        self.onRight1Action = right1Action;
        
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.height.mas_equalTo(NAVITETION_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_20);
            make.top.mas_equalTo(STATEBAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_WIDTH - MARGIN_20 - MARGIN_20);
            make.height.mas_equalTo(NAVITETION_HEIGHT - STATEBAR_HEIGHT);
        }];
        
        [self addSubview:self.leftItem];
        [self.leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT + MARGIN_10, ITEM_HEIHT));
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        
        [self addSubview:self.rightItem];
        [self.rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT, ITEM_HEIHT));
            make.right.mas_equalTo(__weakSelf.mas_right);
        }];
        
        
        [self addSubview:self.rightItem1];
        [self.rightItem1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.equalTo(__weakSelf.rightItem.mas_left);
            make.size.mas_equalTo(CGSizeMake(ITEM_WIDHT, ITEM_HEIHT));
        }];
        
    }
    return self;
}

#pragma mark - getters and setters
- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        _imageView.image = imageNamed(@"icon_navigation_back_image");
    }
    return _imageView;
}


- (UIButton *)leftItem{
    if (!_leftItem) {
        self.leftItem = [[UIButton alloc] init];
        [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _leftItem.titleLabel.font = FONT_OF_SIZE_15;
        [_leftItem setTitle:@"返回" forState:UIControlStateNormal];
        [_leftItem setImage:imageNamed(@"icon_navigation_back") forState:UIControlStateNormal];
        [_leftItem addTarget:self action:@selector(onLeftItemAction:) forControlEvents:UIControlEventTouchUpInside];
        _leftItem.titleEdgeInsets = UIEdgeInsetsMake(10,10,-10,10);
        _leftItem.imageEdgeInsets = UIEdgeInsetsMake(10,-10,-10,0);
    }
    return _leftItem;
}

- (UIButton *)rightItem
{
    if (!_rightItem) {
        self.rightItem = [[UIButton alloc] init];
        [_rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightItem.titleLabel.font = FONT_OF_SIZE_15;
        _rightItem.imageEdgeInsets = UIEdgeInsetsMake(10,0,-10,-10);
        _rightItem.titleEdgeInsets = UIEdgeInsetsMake(20,0,0,0);
        [_rightItem addTarget:self action:@selector(onRightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightItem;
}

- (UIButton *)rightItem1
{
    if (!_rightItem1) {
        self.rightItem1 = [[UIButton alloc] init];
        [_rightItem1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightItem1.titleLabel.font = FONT_OF_SIZE_15;
        _rightItem1.imageEdgeInsets = UIEdgeInsetsMake(10,0,-10,-30);
        _rightItem.titleEdgeInsets = UIEdgeInsetsMake(20,0,0,0);
        [_rightItem1 addTarget:self action:@selector(onRight1ItemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightItem1;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - action
- (void)onLeftItemAction:(UIButton *)sender
{
    if (_onLeftAction) {
        _onLeftAction(sender);
    }
}

- (void)onRightItemAction:(UIButton *)sender
{
    if (_onRightAction) {
        _onRightAction(sender);
    }
}

- (void)onRight1ItemAction:(UIButton *)sender
{
    if (_onRight1Action) {
        _onRight1Action(sender);
    }
}


@end
