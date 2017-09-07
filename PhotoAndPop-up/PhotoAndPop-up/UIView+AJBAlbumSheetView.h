//
//  UIView+AJBAlbumSheetView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/22.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZImagePickerController.h"
//#import "AJBSettingCapitalPasswordViewController.h"
#import "AJBCameraHelper.h"

@interface UIView (AJBAlbumSheetView)<TZImagePickerControllerDelegate>

typedef void (^didFinishPickingPhotosHandle)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOriginalPhoto);
typedef void (^cameraPhotosHandle)();

//- (void) viewControllerShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle navigationController:(UINavigationController *)navigationCountroller;

- (void) viewControllerShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle viewContrller:(UIViewController *)viewController;


- (void) viewShowAlumSheetViewWithMaxImagesCount:(NSInteger) count didFinishPickingPhotosHandle:(didFinishPickingPhotosHandle)didFinishPickingPhotosHandle;


- (UIAlertController *) showSettingCapitalPasswordAlert;
- (UIAlertController *) showSettingCapitalPasswordAlertWithTitle:(NSString *)title;

@end
