//
//  AJBCameraHelper.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/4/18.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCameraHelper.h"

@interface AJBCameraHelper () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) didFinishTakeMediaCompledBlock didFinishTakeMediaCompled;

@end

@implementation AJBCameraHelper


- (instancetype)initWithCompled:(didFinishTakeMediaCompledBlock)compled
{
    if (self = [super init]) {
        
        self.didFinishTakeMediaCompled = compled;
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    self.sourceType = UIImagePickerControllerSourceTypeCamera;

    
}

- (void)dismissPickerViewController:(UIImagePickerController *)picker {
    WEAKSELF
    [picker dismissViewControllerAnimated:YES completion:^{
        __weakSelf.didFinishTakeMediaCompled = nil;
    }];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"didFinishPickingMediaWithInfo");
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageOrientation imageOrientation=image.imageOrientation;
    if(imageOrientation!=UIImageOrientationUp)
    {
        // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
        // 以下为调整图片角度的部分
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // 调整图片角度完毕
    }
    
    if (self.didFinishTakeMediaCompled) {
        self.didFinishTakeMediaCompled(image, info);
    }
    [self dismissPickerViewController:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissPickerViewController:picker];
}


@end
