//
//  AJBProgressPopView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/4/7.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBControlPopView.h"

@interface AJBProgressPopView : AJBControlPopView

+ (AJBProgressPopView *) progressViewWithValue:(NSInteger)value;

- (void) refreshProgressValue:(NSInteger)progressValue;

- (void)fadeOut;

@end
