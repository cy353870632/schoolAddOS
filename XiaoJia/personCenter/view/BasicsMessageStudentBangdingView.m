//
//  BasicsMessageStudentBangdingView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/12.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "BasicsMessageStudentBangdingView.h"
@interface BasicsMessageStudentBangdingView()
{
    NSInteger * width;//this view的宽度
    NSInteger * height;//this view的高度
}
@end
@implementation BasicsMessageStudentBangdingView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        width = (NSInteger)frame.size.width;
        height = (NSInteger)frame.size.height;
        
        [self addSubview:self.studentName_label];
        [self addSubview:self.studentSchool_label];
        [self addSubview:self.studentNo_label];
        [self addSubview:self.studentClass_label];
        [self addSubview:self.cancelBangDing_button];
        
    }
    return self;
}

-(UILabel *)studentName_label
{
    if (!_studentName_label) {
        _studentName_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20,(NSInteger)width,(NSInteger)height/6)];
        [_studentName_label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        _studentName_label.textAlignment = NSTextAlignmentCenter;
        _studentName_label.text = @"王小明";
    }
    return _studentName_label;
}
-(UILabel *)studentSchool_label
{
    if (!_studentSchool_label) {
        _studentSchool_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_studentName_label.frame),(NSInteger)width,(NSInteger)height/6)];
        [_studentSchool_label setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        _studentSchool_label.textAlignment = NSTextAlignmentCenter;
        _studentSchool_label.text = @"厦门第二外国语中学";
    }
    return _studentSchool_label;
}
-(UILabel *)studentNo_label
{
    if (!_studentNo_label) {
        _studentNo_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_studentSchool_label.frame),(NSInteger)width,(NSInteger)height/6)];
        [_studentNo_label setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        _studentNo_label.textAlignment = NSTextAlignmentCenter;
        _studentNo_label.text = @" ＊＊＊＊＊＊  1011";
    }
    return _studentNo_label;
}
-(UILabel *)studentClass_label
{
    if (!_studentClass_label) {
        _studentClass_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_studentNo_label.frame),(NSInteger)width,(NSInteger)height/6)];
        [_studentClass_label setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        _studentClass_label.textAlignment = NSTextAlignmentCenter;
        _studentClass_label.text = @"八年级2班";
    }
    return _studentClass_label;
}
-(UIButton *)cancelBangDing_button
{
    if (!_cancelBangDing_button) {
        _cancelBangDing_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelBangDing_button.frame =CGRectMake((NSInteger)width/4, CGRectGetMaxY(_studentClass_label.frame)+4,(NSInteger)width - (NSInteger)width/2,(NSInteger)height/7);
        _cancelBangDing_button.backgroundColor = blue_color;
        [_cancelBangDing_button setTitle:@"解除绑定" forState:UIControlStateNormal];
        _cancelBangDing_button.tintColor = [UIColor whiteColor];
        _cancelBangDing_button.layer.cornerRadius = 8;
        [_cancelBangDing_button addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBangDing_button;
    
}
-(void)cancelButtonClick:(id)sender{
    
    UIButton * button = sender;
    [self.delegat cancelBangDing:button.tag];
    
}
@end
