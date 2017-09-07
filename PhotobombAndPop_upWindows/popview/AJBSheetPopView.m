//
//  AJBSheetPopView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBSheetPopView.h"
#define BTNTAG 444

@interface AJBSheetPopView ()

@property (nonatomic, assign) BOOL visiableViewCreated;

@end

@implementation AJBSheetPopView

- (id)initWithOptions:(NSArray *) options images:(NSArray *)images action: (void (^)(NSInteger idx)) action
{
    self = [super init];
    if (self)
    {
        _action = action;
        self.options = options;
        self.images = images;
    }
    return self;
}

- (void) createVisiableViews
{
    self.visiableViewCreated = YES;
    
    CGFloat height =  170;
    self.frame = CGRectMake(0,SCREEN_HEIGHT - height,SCREEN_WIDTH, height);
    self.backgroundColor = [UIColor whiteColor];
    [self createOptionButtons];
}

- (void) createOptionButtons
{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0,MARGIN_15,SCREEN_WIDTH,MARGIN_15)];
    title.text = @"分享到";
    title.font = FONT_OF_SIZE_14;
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = COLOR_UI_333333;
    [self addSubview:title];
    
    UIImage *image = imageNamed(@"icon_share_content_dotted_line");
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(MARGIN_15,title.centerY,SCREEN_WIDTH - MARGIN_30,image.size.height)];
    imageView.image = image;
    [self addSubview:imageView];

        CGFloat btnWidth = SCREEN_WIDTH/(_options.count-1);
        CGFloat btnHeight = 80;
    
        for (int i = 0; i<_options.count; i++)
        {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*btnWidth,MARGIN_40+MARGIN_5,btnWidth, btnHeight)];
            button.tag = i + BTNTAG;
            button.titleLabel.font = FONT_OF_SIZE_12;
            [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:[_options objectAtIndex:i] forState:UIControlStateNormal];
            [button setTitleColor:COLOR_UI_333333 forState:UIControlStateNormal];
            [button setImage:imageNamed([_images objectAtIndex:i]) forState:UIControlStateNormal];
            
            if (i == _options.count - 1) {
                UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_15,0,SCREEN_WIDTH - MARGIN_30, 0.5)];
                line.backgroundColor = COLOR_UI_dddddd;
                [button addSubview:line];
                button.frame = CGRectMake(0,btnHeight+35+MARGIN_10,SCREEN_WIDTH,45);
            }
            if (i != _options.count -1) {
                [button setIconInTopWithSpacing:MARGIN_15];
            }
            [self addSubview:button];
            
        }
}

- (void)show
{
    [super show];
    if (!_visiableViewCreated) {
        [self createVisiableViews];
    }
}

- (void)actionClick:(UIButton *)sender
{
    _action(sender.tag - BTNTAG);
}




@end
