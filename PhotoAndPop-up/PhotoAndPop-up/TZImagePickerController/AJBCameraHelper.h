//
//  AJBCameraHelper.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/4/18.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^didFinishTakeMediaCompledBlock)(UIImage *image, NSDictionary *editingInfo);

@interface AJBCameraHelper : UIImagePickerController

- (instancetype)initWithCompled:(didFinishTakeMediaCompledBlock)compled;

@end
