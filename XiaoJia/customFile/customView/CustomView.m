//
//  CustomView.m
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //返回按钮
        self.back_button.frame = CGRectMake(20,35, 20, 30);
        [self addSubview:self.back_button];
        
        self.title_label.frame = CGRectMake(MAINSCREEN.width/2.5,35, MAINSCREEN.width-MAINSCREEN.width/1.25, 30);
        [self addSubview:self.title_label];
    }
    return self;
}
-(UIButton *)back_button{
    if (!_back_button) {
        _back_button = [UIButton buttonWithType:UIButtonTypeSystem];
        UIImage * back_img = [UIImage imageNamed:@"dpzs_icon14"];
        [_back_button setImage:back_img forState:UIControlStateNormal];
        _back_button.hidden = YES;
    }
    return _back_button;
}
-(UILabel *)title_label
{
    if (!_title_label) {
        _title_label = [[UILabel alloc]init];
        _title_label.font = [UIFont fontWithName:@"Futura-Medium" size:15];
        _title_label.hidden = YES;
        _title_label.textColor = blue_color;
        
    }
    return _title_label;
}
//注销通知
- (void) dealloc {
    
    [MSNotificationCenter removeObserver:self];
    
}
//点击空白，取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}
@end
