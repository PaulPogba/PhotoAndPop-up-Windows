//
//  AJBInsuranceBasePopView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/5/5.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJBInsuranceBasePopView : UIView


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *cannel;


- (void) refreshWithTitle:(NSString *)title;

//- (void) createVisiableViews;

- (void) dismiss;

@end
