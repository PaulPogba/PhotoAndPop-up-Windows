//
//  AJBProgressPopView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/4/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProgressPopView.h"
#import "AJBProgressView.h"

@interface AJBProgressPopView ()

@property (nonatomic, strong) AJBProgressView *progressView;
@property (nonatomic, assign) NSInteger progressValue;
@end

@implementation AJBProgressPopView

- (instancetype)initWithProgressValue:(NSInteger)value
{
    if (self = [super init])
    {        
        [self addSubview:self.progressView];
        
    }
    return self;
}

- (AJBProgressView *) progressView {

    if (!_progressView) {
        self.progressView = [[AJBProgressView alloc] initWithFrame:CGRectMake(MARGIN_20,(SCREEN_HEIGHT - NAVITETION_HEIGHT - MARGIN_20)/2,SCREEN_WIDTH - MARGIN_40,MARGIN_10)];
        _progressView.progressTintColor = COLOR_UI_54C1F5;
        _progressView.trackTintColor = COLOR_UI_22BD7A;
    }
    return _progressView;
}

- (void) refreshProgressValue:(NSInteger)progressValue
{
    _progressView.progressValue = progressValue;
}

+ (AJBProgressPopView *) progressViewWithValue:(NSInteger)value
{
    AJBProgressPopView *progressView = [[AJBProgressPopView alloc] initWithProgressValue:value];
    return progressView;
}

#pragma mark -- 重写父类消失方法
- (void)show
{
    self.overlayView.frame = CGRectMake(0,NAVITETION_HEIGHT,SCREEN_WIDTH, SCREEN_HEIGHT - NAVITETION_HEIGHT);
    self.overlayView.backgroundColor = [UIColor clearColor];
    
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self.overlayView];
    [keywindow addSubview:self];
    self.frame = CGRectMake(0,NAVITETION_HEIGHT,SCREEN_WIDTH, SCREEN_HEIGHT - NAVITETION_HEIGHT);
    
    [self fadeIn];
}

- (void)fadeOut
{
    __weak AJBProgressPopView *__self = self;
    [UIView animateWithDuration:0.05 animations:^{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFade;
        [__self.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        if (finished) {
            __self.alpha = 0.0;
            __self.overlayView.alpha = 0.0;
            [__self.overlayView removeFromSuperview];
        }
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        
}


@end
