//
//  ThreeViewController.m
//  PhotobombAndPop_upWindows
//
//  Created by Marchisio on 2017/9/6.
//  Copyright © 2017年 Marchisio. All rights reserved.
//

#import "ThreeViewController.h"
#import "UIView+AJBAlbumSheetView.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
        WEAKSELF
        NSInteger maxCount = 3;
        [self.view viewShowAlumSheetViewWithMaxImagesCount:maxCount didFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            [photos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            }];
        }];

    
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
