//
//  LeavingMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/12.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "LeavingMessageViewController.h"

@interface LeavingMessageViewController ()

@end

@implementation LeavingMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.leavingDate_label];
    [self.view addSubview:self.leavingTime_label];
    [self.view addSubview:self.leavingType_label];
    [self.view addSubview:self.leavingContent_label];
    [self.view addSubview:self.teacherReader_label];
    [self.view addSubview:self.teacherHuiFu_label];
    
}
-(UILabel *)leavingDate_label
{
    if (!_leavingDate_label) {
        _leavingDate_label = [[UILabel alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width, MAINSCREEN.height/15)];
        _leavingDate_label.layer.borderColor =Q_gray_color.CGColor;
        _leavingDate_label.layer.borderWidth = 0.5;
        _leavingDate_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        [_leavingDate_label setBackgroundColor:[UIColor whiteColor]];
        _leavingDate_label.text = @"      请假日期：2017.2.12 8:00 --- 2017.2.13 16:00 ";
    }
    return _leavingDate_label;
}
-(UILabel *)leavingTime_label
{
    if (!_leavingTime_label) {
        _leavingTime_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.leavingDate_label.frame), MAINSCREEN.width, MAINSCREEN.height/15)];
        _leavingTime_label.layer.borderColor = Q_gray_color.CGColor;
        _leavingTime_label.layer.borderWidth = 0.5;
        [_leavingTime_label setBackgroundColor:[UIColor whiteColor]];
        _leavingTime_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        _leavingTime_label.text = @"      请假日长：1.5 天 ";
    }
    return _leavingTime_label;
}
-(UILabel *)leavingType_label
{
    if (!_leavingType_label) {
        _leavingType_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.leavingTime_label.frame), MAINSCREEN.width, MAINSCREEN.height/15)];
        _leavingType_label.layer.borderColor = Q_gray_color.CGColor;
        _leavingType_label.layer.borderWidth = 0.5;
        [_leavingType_label setBackgroundColor:[UIColor whiteColor]];
        _leavingType_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        _leavingType_label.text = @"      请假类型：病假 ";
    }
    return _leavingType_label;
}
-(UILabel *)leavingContent_label
{
    if (!_leavingContent_label) {
        _leavingContent_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.leavingType_label.frame), MAINSCREEN.width, MAINSCREEN.height/5)];
        _leavingContent_label.layer.borderColor = Q_gray_color.CGColor;
        _leavingContent_label.layer.borderWidth = 0.5;
        _leavingContent_label.lineBreakMode = NSLineBreakByCharWrapping;
        _leavingContent_label.numberOfLines = 0;
        [_leavingContent_label setBackgroundColor:[UIColor whiteColor]];
        _leavingContent_label.font = [UIFont fontWithName:@"Helvetica" size:13];
        _leavingContent_label.text = @"      备注：孩子这几天身体不太好，需要好好的休息休息，希望老师可以允许孩子请假1.5天 ";
    }
    return _leavingContent_label;
}
-(UILabel *)teacherReader_label
{
    if (!_teacherReader_label) {
        _teacherReader_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.leavingContent_label.frame), MAINSCREEN.width, MAINSCREEN.height/15)];
        _teacherReader_label.layer.borderColor = Q_gray_color.CGColor;
        _teacherReader_label.layer.borderWidth = 0.5;
        [_teacherReader_label setBackgroundColor:[UIColor whiteColor]];
        _teacherReader_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        _teacherReader_label.text = @"      批复状态：已读 ";
    }
    return _teacherReader_label;
}
-(UILabel *)teacherHuiFu_label
{
    if (!_teacherHuiFu_label) {
        _teacherHuiFu_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.teacherReader_label.frame), MAINSCREEN.width, MAINSCREEN.height/5)];
        _teacherHuiFu_label.layer.borderColor = Q_gray_color.CGColor;
        _teacherHuiFu_label.layer.borderWidth = 0.5;
        [_teacherHuiFu_label setBackgroundColor:[UIColor whiteColor]];
        _teacherHuiFu_label.lineBreakMode = NSLineBreakByCharWrapping;
        _teacherHuiFu_label.numberOfLines = 0;
        _teacherHuiFu_label.font = [UIFont fontWithName:@"Helvetica" size:13];
        _teacherHuiFu_label.text = @"      教师回复：好好让孩子休息 ";
    }
    return _teacherHuiFu_label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
