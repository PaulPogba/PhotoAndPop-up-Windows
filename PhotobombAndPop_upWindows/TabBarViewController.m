//
//  TabBarViewController.m
//  PhotobombAndPop_upWindows
//
//  Created by Marchisio on 2017/9/6.
//  Copyright © 2017年 Marchisio. All rights reserved.
//

#import "TabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    OneViewController *one = [[OneViewController alloc] init];
    UINavigationController *navOne = [[UINavigationController alloc] initWithRootViewController:one];
    navOne.tabBarItem.title = @"One";
    
    TwoViewController *two = [[TwoViewController alloc] init];
    UINavigationController *navTwo = [[UINavigationController alloc] initWithRootViewController:two];
    navTwo.tabBarItem.title = @"Two";
    self.viewControllers =  @[navOne,navTwo];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
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
