//
//  AJBAlertPopView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBAlertPopView.h"

@interface AJBAlertPopView ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *line;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, copy) void (^onDone)();

@end


@implementation AJBAlertPopView

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail image:(NSString *)image onDoneAction:(void (^)())done
{
    if (self = [super init]) {
        self.frame = CGRectMake(0,SCREEN_HEIGHT/2 - 260/2,SCREEN_WIDTH, 260);
        self.backgroundColor = [UIColor clearColor];
        
        WEAKSELF
        self.onDone = done;
        [self addSubview:self.view];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.centerY.equalTo(__weakSelf.mas_centerY);
            make.width.mas_equalTo(SCREEN_WIDTH - MARGIN_60);
            make.height.mas_equalTo(260);
        }];
        

        [self.view addSubview:self.imageView];
        _imageView.image = imageNamed(image);
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(40);
            make.centerX.equalTo(__weakSelf.view.mas_centerX);
            make.size.mas_equalTo(__weakSelf.imageView.image.size);
        }];
        
        [self.view addSubview:self.titleLabel];
        _titleLabel.text = title;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_10);
            make.top.equalTo(__weakSelf.imageView.mas_bottom).offset(MARGIN_10);
            make.right.equalTo(__weakSelf.view.mas_right).offset(-MARGIN_10);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        
        [self.view addSubview:self.detailLabel];
        _detailLabel.text = detail;
        [_detailLabel sizeToFit];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(__weakSelf.titleLabel.mas_bottom).offset(MARGIN_8);
            make.width.equalTo(__weakSelf.detailLabel.mas_width);
            make.centerX.equalTo(__weakSelf.view.mas_centerX);
            make.height.mas_equalTo(MARGIN_20);
        }];
        
        [self.view addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(__weakSelf.detailLabel.mas_left).offset(-MARGIN_5);
            make.centerY.equalTo(__weakSelf.detailLabel.mas_centerY);
            make.size.mas_equalTo(__weakSelf.iconImageView.image.size);
        }];
        
        [self.view addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(__weakSelf.view.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.equalTo(__weakSelf.view.mas_width);
            make.height.mas_equalTo(45);
        }];
        
        [self.view addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.equalTo(__weakSelf.button.mas_top);
            make.right.equalTo(__weakSelf.view.mas_right);
            make.height.mas_equalTo(1);
        }];
        
//        [self popWithTitle:title detail:detail image:image];
    }
    return self;
}


#pragma mark - getters and setters 
- (UIView *)view
{
    if (!_view) {
        self.view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 3;
    }
    return _view;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc]init];
        _titleLabel.font = FONT_OF_SIZE_14;
        _titleLabel.textColor = COLOR_UI_333333;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        self.detailLabel = [[UILabel alloc]init];
        _detailLabel.font = FONT_OF_SIZE_14;
        _detailLabel.textColor = COLOR_UI_888888;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = imageNamed(@"icon_me_prompt");
    }
    return _iconImageView;
}

- (UILabel *)line
{
    if (!_line) {
        self.line = [[UILabel alloc] init];
        _line.backgroundColor = COLOR_UI_dddddd;
    }
    return _line;
}

- (UIButton *)button
{
    if (!_button) {
        self.button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(onDoneAction:) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitleColor:COLOR_UI_54C1F5 forState:UIControlStateNormal];
        [_button setTitle:@"完成" forState: UIControlStateNormal];
        _button.titleLabel.font = FONT_OF_SIZE_14;
    }
    return _button;
}




- (void) popWithTitle:(NSString *)title detail:(NSString *)detail image:(NSString *)image
{
    
}

- (void) onDoneAction:(UIButton *)sender
{
    [self fadeOut];
    
    if (_onDone) {
        self.onDone();
    }
}

#pragma mark -- 重写父类消失方法
- (void)fadeOut
{
    WEAKSELF
    [UIView animateWithDuration:0.05 animations:^{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFade;
        [__weakSelf.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        if (finished) {
            __weakSelf.alpha = 0.0;
            __weakSelf.overlayView.alpha = 0.0;
            [__weakSelf.overlayView removeFromSuperview];
        }
    }];
}


@end
