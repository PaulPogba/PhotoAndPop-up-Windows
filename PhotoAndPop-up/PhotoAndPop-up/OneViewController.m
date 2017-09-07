//
//  OneViewController.m
//  PhotobombAndPop_upWindows
//
//  Created by Marchisio on 2017/9/6.
//  Copyright © 2017年 Marchisio. All rights reserved.
//

#import "OneViewController.h"
#import "UIView+AJBAlbumSheetView.h"

#import "AJBAlertPopView.h"
#import "AJBControlPopView.h"
#import "AJBInsuranceBasePopView.h"
#import "AJBProgressPopView.h"
#import "AJBSheetPopView.h"
#import "AJBProgressView.h"


@interface OneViewController ()
@property (nonatomic,strong) NSMutableArray *imageArray;
@property (nonatomic, strong) AJBProgressPopView *progressView;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.hidden = YES;

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    WEAKSELF
    
    /*
     
     进度条
    self.progressView = [AJBProgressPopView progressViewWithValue:5];
    [__weakSelf.progressView show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [__weakSelf.progressView refreshProgressValue:8];
    });
    */
    /*
     
    AJBAlertPopView *alert = [[AJBAlertPopView alloc] initWithTitle:@"提现申请成功" detail:@"请耐心等待系统处理" image:@"icon_me_success" onDoneAction:^{
        [alert dismiss];
    }];
    [alert show];
    */
   /*
    //打开相册
    WEAKSELF
    NSInteger maxCount = 3;
    [self.view viewShowAlumSheetViewWithMaxImagesCount:maxCount didFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [photos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [__weakSelf.imageArray addObject:obj];
        }];
    }];
    */
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
