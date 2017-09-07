//
//  DOCNavigationViewController.m
//  docClient
//
//  Created by nuhgroup on 2017/7/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "DOCNavigationViewController.h"

@interface DOCNavigationViewController ()

@end

@implementation DOCNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    self.navigationBar.shadowImage = [UIImage imageNamed:@""];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

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
