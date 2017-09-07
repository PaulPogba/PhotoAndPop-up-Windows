//
//  DOCBaseViewController.h
//  docClient
//
//  Created by nuhgroup on 2017/7/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DOCNavigationView.h"

@interface DOCBaseViewController : UIViewController

@property (nonatomic, strong) DOCNavigationView *navigationView;

- (void) onLeftItemAction:(UIButton *) sender;

- (void) onRightItemAction:(UIButton *) sender;

- (void) onRight1ItemAction:(UIButton *) sender;


- (void) setRightBarButtonItem1WithTitle:(NSString *)title;

- (void) setRightBarButtonItem2WithTitle:(NSString *)title;

- (void) setRightBarButtonItem1WithImage:(NSString *)image;

- (void) setRightBarButtonItem2WithImage:(NSString *)image;

- (void) setLeftBarButtonItemWithTitle:(NSString *)title;

- (void) setLeftBarButtonItemWithImage:(NSString *)image;

- (void) setTitleText:(NSString *)title;



- (void) setHidenLeftItem:(BOOL)hidden;

@end
