//
//  AJBControlPopView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBControlPopView : UIView

@property (nonatomic, strong) UIControl *overlayView;

- (instancetype)init;

- (void)show;
- (void)fadeOut;
- (void) dismiss;
- (void)fadeIn;


@end
