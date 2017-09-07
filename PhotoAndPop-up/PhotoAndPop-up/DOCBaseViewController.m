//
//  DOCBaseViewController.m
//  docClient
//
//  Created by nuhgroup on 2017/7/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "DOCBaseViewController.h"


@interface DOCBaseViewController ()

@end

@implementation DOCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationView.frame = CGRectMake(0,0, SCREEN_WIDTH, NAVITETION_HEIGHT);
    [self.view addSubview:self.navigationView];
}

#pragma mark - getters and setters
- (DOCNavigationView *)navigationView
{
    if (!_navigationView) {
        WEAKSELF
        self.navigationView = [[DOCNavigationView alloc] initWithLeftAction:^(UIButton *leftItem) {
            [__weakSelf onLeftItemAction:leftItem];
        } rightAction:^(UIButton *rightItem) {
            [__weakSelf onRightItemAction:rightItem];
        } right1Action:^(UIButton *rightItem1) {
            [__weakSelf onRight1ItemAction:rightItem1];
        }];
    }
    return _navigationView;
}


#pragma mark - action
- (void) onLeftItemAction:(UIButton *) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) onRightItemAction:(UIButton *) sender
{
    
}

- (void) onRight1ItemAction:(UIButton *) sender
{
    
}
- (void)setHidenLeftItem:(BOOL)hidden
{
    self.navigationView.leftItem.hidden = hidden;
}


- (void) setRightBarButtonItem1WithTitle:(NSString *)title
{
    [self.navigationView.rightItem setTitle:title forState:UIControlStateNormal];
    
}

- (void) setRightBarButtonItem2WithTitle:(NSString *)title
{
    [self.navigationView.rightItem1 setTitle:title forState:UIControlStateNormal];
    
}

- (void) setRightBarButtonItem1WithImage:(NSString *)image
{
    [self.navigationView.rightItem setImage:imageNamed(image) forState:UIControlStateNormal];
    [self.navigationView.rightItem setImage:imageNamed(image) forState:UIControlStateHighlighted];
    
}

- (void) setRightBarButtonItem2WithImage:(NSString *)image
{
    [self.navigationView.rightItem1 setImage:imageNamed(image) forState:UIControlStateNormal];
    
}

- (void) setLeftBarButtonItemWithTitle:(NSString *)title
{
    [self.navigationView.leftItem setTitle:title forState:UIControlStateNormal];
}

- (void) setLeftBarButtonItemWithImage:(NSString *)image
{
    [self.navigationView.leftItem setImage:imageNamed(image) forState:UIControlStateNormal];
}

- (void) setTitleText:(NSString *)title
{
    self.navigationView.titleLabel.text = title;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
