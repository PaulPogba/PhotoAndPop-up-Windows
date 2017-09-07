//
//  AJBInsuranceBasePopView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/5/5.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBInsuranceBasePopView.h"

@implementation AJBInsuranceBasePopView

- (instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        [self createVisiableViews];
    }
    return self;
}

- (void) createVisiableViews
{
    WEAKSELF
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(MARGIN_30);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(60);
    }];
    
    [self addSubview:self.cannel];
    [self.cannel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SCREEN_WIDTH - 60);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(__weakSelf.titleLabel.mas_bottom).offset(-0.5);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(0.5);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT_OF_SIZE_15;
        _titleLabel.textColor = COLOR_UI_333333;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)cannel
{
    if (!_cannel) {
        self.cannel = [[UIButton alloc] init];
        [_cannel setImage:imageNamed(@"icon_insurance_close") forState:UIControlStateNormal];
        [_cannel addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cannel;
}

- (UIView *)line{
    if (!_line) {
        self.line = [[UIView alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}

- (void) dismiss
{
    
}

- (void) refreshWithTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

@end
