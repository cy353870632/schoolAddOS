//
//  GradeCeshiView.m
//  XiaoJia
//
//  Created by 程远 on 17/5/8.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GradeCeshiView.h"

@implementation GradeCeshiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.title_label];
        [self addSubview:self.grade_label];
        [self addSubview:self.start_button];
    }
    return self;
}
-(UILabel *)title_label
{
    if (!_title_label) {
        _title_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN.width/2.45, MAINSCREEN.height/7/4)];
        _title_label.textAlignment = NSTextAlignmentCenter;
        [_title_label setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    }
    return _title_label;
}
-(UILabel *)grade_label
{
    if (!_grade_label) {
        _grade_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.title_label.frame), MAINSCREEN.width/2.45, MAINSCREEN.height/7/4)];
        _grade_label.textAlignment = NSTextAlignmentCenter;
        [_grade_label setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    }
    return _grade_label;
}
-(UIButton *)start_button
{
    if (!_start_button) {
        _start_button = [UIButton buttonWithType:UIButtonTypeCustom];
        _start_button.frame = CGRectMake(0, CGRectGetMaxY(self.grade_label.frame)+10, MAINSCREEN.width/2.45, MAINSCREEN.height/7/2-20);
        [_start_button setTitle:@"开始测试" forState:UIControlStateNormal];
        _start_button.layer.cornerRadius = 7;
        _start_button.backgroundColor = blue_color;
        [_start_button addTarget:self action:@selector(startTest:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _start_button;
}
-(void)startTest:(id)sender{
    UIButton * button = sender;
    NSLog(@"开始测试第 %ld 个学科",(long)button.tag);
    [self.delegat startTest:button.tag];
}
@end
