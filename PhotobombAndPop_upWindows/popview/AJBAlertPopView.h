//
//  AJBAlertPopView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/21.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBControlPopView.h"

@interface AJBAlertPopView : AJBControlPopView

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail image:(NSString *)image onDoneAction:(void (^)())done;

@end
