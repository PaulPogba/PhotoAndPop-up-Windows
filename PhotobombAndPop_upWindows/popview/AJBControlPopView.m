//
//  AJBControlPopView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBControlPopView.h"
//#import "AJBBaseLimitTableViewController.h"
@implementation AJBControlPopView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.alpha=0;
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];

        [self createOverlay];
    }
    return self;
}

- (void) createOverlay
{
    self.clipsToBounds = TRUE;
    
    self.overlayView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [_overlayView addTarget:self
                     action:@selector(dismiss)
           forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - animations
- (void)fadeIn
{
    WEAKSELF
    [UIView animateWithDuration:0.05 animations:^{
//        __self.alpha = 1;
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFromTop;
        [__weakSelf.layer addAnimation:animation forKey:@"animation"];
    } completion:^(BOOL finished) {
        __weakSelf.alpha = 1;
        __weakSelf.overlayView.alpha = 1;
    }];
}

- (void)fadeOut
{
    WEAKSELF
    [UIView animateWithDuration:0.05 animations:^{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 0.2f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeForwards;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFromBottom;
        [__weakSelf.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        __weakSelf.alpha = 0.0;
        __weakSelf.overlayView.alpha = 0.0;

        if (finished) {
            [__weakSelf.overlayView removeFromSuperview];
            [__weakSelf removeAllSubviews];
            [__weakSelf removeFromSuperview];
        }
    }];
}


//-(void)fadeIn
//{
// WEAKSELF
//    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        
//        __weakSelf.overlayView.transform = CGAffineTransformMakeTranslation(0,SCREEN_HEIGHT/2);
//        __weakSelf.alpha++;
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//}
//
//- (void)fadeOut
//{
//    WEAKSELF
//    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        
//        __weakSelf.overlayView.transform = CGAffineTransformMakeTranslation(0,0);
//        __weakSelf.alpha--;
////        [self.responsder endEditing:NO];
//        
//    } completion:^(BOOL finished) {
//        if (finished) {
//            [__weakSelf.overlayView removeFromSuperview];
//            [__weakSelf removeAllSubviews];
//            [__weakSelf removeFromSuperview];
//        }
//        
//    }];
//}


- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    [self fadeIn];
    
}

- (void) dismiss
{
    [self fadeOut];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}



@end
