//
//  LandingViewController.m
//  PhotobombAndPop_upWindows
//
//  Created by Marchisio on 2017/9/6.
//  Copyright © 2017年 Marchisio. All rights reserved.
//

#import "LandingViewController.h"
#import "UIView+AJBAlbumSheetView.h"
#import "ThreeViewController.h"
@interface LandingViewController ()
@property (nonatomic,strong) NSMutableArray *imageArray;

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    WEAKSELF
    NSInteger maxCount = 3;
    [self.view viewShowAlumSheetViewWithMaxImagesCount:maxCount didFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [photos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [__weakSelf.imageArray addObject:obj];
        }];
    }];
//    ThreeViewController *vc = [[ThreeViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark 懒加载
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
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
