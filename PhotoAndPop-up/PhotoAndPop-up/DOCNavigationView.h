//
//  DOCNavigationView.h
//  docClient
//
//  Created by nuhgroup on 2017/7/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOCNavigationView : UIView

- (id)initWithLeftAction: (void (^)(UIButton *leftItem)) leftAction rightAction:(void(^)(UIButton *rightItem)) rightAction right1Action:(void(^)(UIButton *rightItem1)) right1Action;

@property (copy, nonatomic) void (^onLeftAction)(UIButton *leftItem);
@property (copy, nonatomic) void (^onRightAction)(UIButton *rightItem);
@property (copy, nonatomic) void (^onRight1Action)(UIButton *rightItem1);

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *leftItem;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightItem;
@property (nonatomic, strong) UIButton *rightItem1;

- (void) onLeftItemAction:(UIButton *) sender;
- (void) onRightItemAction:(UIButton *) sender;
- (void) onRight1ItemAction:(UIButton *) sender;



@end
