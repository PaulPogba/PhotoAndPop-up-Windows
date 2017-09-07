//
//  AJBSheetPopView.h
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJBControlPopView.h"

@interface AJBSheetPopView : AJBControlPopView

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) NSArray *images;

@property (copy, nonatomic) void (^action)(NSInteger idx);

- (id)initWithOptions:(NSArray *) options images:(NSArray *)images action: (void (^)(NSInteger idx)) action;

- (void) show;

- (void)actionClick:(UIButton *)sender;



@end
