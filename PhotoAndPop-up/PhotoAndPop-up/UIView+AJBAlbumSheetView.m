//
//  UIView+AJBAlbumSheetView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "UIView+AJBAlbumSheetView.h"
#import "DOCNavigationViewController.h"


@implementation UIView (AJBAlbumSheetView)

//- (void) viewControllerShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle navigationController:(UINavigationController *)navigationCountroller
//{
//    WEAKSELF
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count imagesCount: 50 delegate:__weakSelf];
//        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
//            didFinishPickingPhotosHandle(photos,assets,isSelectOriginalPhoto);
//        }];
//        
//        imagePickerVc.allowPickingOriginalPhoto = NO;
//        imagePickerVc.allowPickingVideo = NO;
//        [navigationCountroller presentViewController:imagePickerVc animated:YES completion:nil];
//    }];
//    
//    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        AJBCameraHelper *camera =[[AJBCameraHelper alloc] initWithCompled:^(UIImage *image, NSDictionary *editingInfo) {
//            didFinishPickingPhotosHandle(@[image],nil,NO);
//
//        }];
//        [navigationCountroller presentViewController:camera animated:YES completion:nil];
//    }];
//    [alert addAction:photo];
//    [alert addAction:camera];
//    [alert addAction:cannel];
//    [navigationCountroller presentViewController:alert animated:YES completion:nil];
//}

- (void) viewControllerShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle viewContrller:(UIViewController *)viewController
{
    WEAKSELF
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count imagesCount: 50 delegate:__weakSelf];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            didFinishPickingPhotosHandle(photos,assets,isSelectOriginalPhoto);
        }];
        
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingVideo = NO;
        [viewController.navigationController presentViewController:imagePickerVc animated:YES completion:nil];
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AJBCameraHelper *camera =[[AJBCameraHelper alloc] initWithCompled:^(UIImage *image, NSDictionary *editingInfo) {
            didFinishPickingPhotosHandle(@[image],nil,NO);
        }];
        [viewController presentViewController:camera animated:YES completion:nil];
        
    }];
    [alert addAction:photo];
    [alert addAction:camera];
    [alert addAction:cannel];
    [viewController.navigationController presentViewController:alert animated:YES completion:nil];

}



- (void) viewShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle
{
    UIAlertController *alert = [self showAlumSheetViewWithMaxImagesCount:count imagesCount:50 didFinishPickingPhotosHandle:didFinishPickingPhotosHandle];

    [self.viewController presentViewController:alert animated:YES completion:nil];
}


- (UIAlertController *)showAlumSheetViewWithMaxImagesCount:(NSInteger) count imagesCount:(NSInteger)imagesCount didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle
{
    WEAKSELF
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count imagesCount: imagesCount delegate:__weakSelf];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            didFinishPickingPhotosHandle(photos,assets,isSelectOriginalPhoto);
        }];
        
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingVideo = NO;
        [__weakSelf.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AJBCameraHelper *camera =[[AJBCameraHelper alloc] initWithCompled:^(UIImage *image, NSDictionary *editingInfo) {
            didFinishPickingPhotosHandle(@[image],nil,NO);
        }];
        [__weakSelf.viewController presentViewController:camera animated:YES completion:nil];

    }];
    [alert addAction:photo];
    [alert addAction:camera];
    [alert addAction:cannel];
    return alert;
}

//- (UIAlertController *) showSettingCapitalPasswordAlert
//{
//    return  [self showSettingCapitalPasswordAlertWithTitle:@"您还未设置资金密码\n无法进行充值"];
//}
//
//- (UIAlertController *) showSettingCapitalPasswordAlertWithTitle:(NSString *)title
//{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    
//    UIAlertAction *setting = [UIAlertAction actionWithTitle:@"立即设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        AJBSettingCapitalPasswordViewController *vc = [[AJBSettingCapitalPasswordViewController alloc] initWithType:SettingCapitalPasswordType_setting];
//        [self.navigationController pushViewController:vc animated:YES];
//        
//    }];
//    [alert addAction:cannel];
//    [alert addAction:setting];
//    //    [self.navigationController presentViewController:alert animated:YES completion:nil];
//    return alert;
//}

@end
