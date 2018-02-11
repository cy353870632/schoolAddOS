//
//  GrayBackgroundView.m
//  XiaoJia
//
//  Created by 程远 on 17/2/24.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GrayBackgroundView.h"

@implementation GrayBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = gray_color;
        self.alpha = 0.7;
        self.userInteractionEnabled = YES;
        [self.deleget didselectGrayBackGroundView];
    }
    return self;
}
//点击空白，取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.deleget didselectGrayBackGroundView];
}
@end
