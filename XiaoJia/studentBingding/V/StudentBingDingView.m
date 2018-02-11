//
//  StudentBingDingView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "StudentBingDingView.h"

@interface StudentBingDingView()<UITextFieldDelegate>
@end
@implementation StudentBingDingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //城市选择
        UILabel * cityChoose_label = [[UILabel alloc]initWithFrame:CGRectMake(0,MAINSCREEN.height/10, MAINSCREEN.width, MAINSCREEN.height/11)];
        cityChoose_label.layer.borderWidth = 0.5;
        cityChoose_label.userInteractionEnabled = YES;
        cityChoose_label.layer.borderColor = Q_gray_color.CGColor;
        [cityChoose_label setText:@"      城市："];
        cityChoose_label.userInteractionEnabled = YES;
        cityChoose_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self addSubview:cityChoose_label];
        [cityChoose_label addSubview:self.city_label];
        
        //学校选择
        UILabel * schoolChoose_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cityChoose_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
        schoolChoose_label.layer.borderWidth = 0.5;
        schoolChoose_label.userInteractionEnabled = YES;
        schoolChoose_label.layer.borderColor = Q_gray_color.CGColor;
        schoolChoose_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        [schoolChoose_label setText:@"      学校："];
        [self addSubview:schoolChoose_label];
        [schoolChoose_label addSubview:self.school_label];
        //学生姓名
        UILabel * studentName_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(schoolChoose_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
        studentName_label.layer.borderWidth = 0.5;
        studentName_label.userInteractionEnabled = YES;
        studentName_label.layer.borderColor = Q_gray_color.CGColor;
        studentName_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        [studentName_label setText:@"      姓名："];
        [self addSubview:studentName_label];
        [studentName_label addSubview:self.studentName_textField];
        //学生学号
        UILabel * studentNo_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(studentName_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
        studentNo_label.layer.borderWidth = 0.5;
        studentNo_label.userInteractionEnabled = YES;
        studentNo_label.layer.borderColor = Q_gray_color.CGColor;
        studentNo_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        [studentNo_label setText:@"      学号："];
        [self addSubview:studentNo_label];
        [studentNo_label addSubview:self.studentNo_textField];
        
        self.bingding_button.frame = CGRectMake(MAINSCREEN.width/5, CGRectGetMaxY(studentNo_label.frame)+30, MAINSCREEN.width-MAINSCREEN.width/2.5, MAINSCREEN.height/17);
        [self addSubview:self.bingding_button];
    }
    return self;
}
-(void)cityChooseClick
{
    [self.deleget cityChoose];
}
-(void)schoolChooseClick
{
    if ([self.city_label.text isEqualToString:@"请选择城市"]) {
        [self makeToast:@"请先选择城市" duration:1.5 position:@"center"];//在中间显示土司
    }else{
        [self.deleget schoolChoose];
//        [self addSubview:self.schoolChooseView];
    }
    
    
}
-(UILabel *)city_label
{
    if (!_city_label) {
        _city_label = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3,0, MAINSCREEN.width-MAINSCREEN.width/1.7, MAINSCREEN.height/11)];
        _city_label.userInteractionEnabled = YES;
        [_city_label setText:@"请选择城市"];
        _city_label.textColor = Q_gray_color;
        _city_label.userInteractionEnabled = YES;
        _city_label.font = [UIFont fontWithName:@"Helvetica" size:18];
        UITapGestureRecognizer * cityChoose_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cityChooseClick)];
        [_city_label addGestureRecognizer:cityChoose_tap];
    }
    return _city_label;
}
-(UILabel *)school_label
{
    if (!_school_label) {
        _school_label = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3,0, MAINSCREEN.width-MAINSCREEN.width/1.7, MAINSCREEN.height/11)];
        _school_label.userInteractionEnabled = YES;
        [_school_label setText:@"请选择学校"];
        _school_label.textColor = Q_gray_color;
        _school_label.userInteractionEnabled = YES;
        _school_label.font = [UIFont fontWithName:@"Helvetica" size:18];
        UITapGestureRecognizer * schoolChoose_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(schoolChooseClick)];
        [_school_label addGestureRecognizer:schoolChoose_tap];
    }
    return _school_label;
}

-(UITextField *)studentName_textField
{
    if (!_studentName_textField) {
        //姓名
        _studentName_textField = [[UITextField alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3, 0,MAINSCREEN.width-MAINSCREEN.width/1.8, MAINSCREEN.height/11)];
        _studentName_textField.placeholder = @"学生姓名";
        _studentName_textField.delegate = self;
        _studentName_textField.tag = 1;
        _studentName_textField.font = [UIFont fontWithName:@"Helvetica" size:18];
        [_studentName_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return _studentName_textField;
}
-(UITextField *)studentNo_textField
{
    if (!_studentNo_textField) {
        //姓名
        _studentNo_textField = [[UITextField alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3, 0,MAINSCREEN.width-MAINSCREEN.width/3, MAINSCREEN.height/11)];
        _studentNo_textField.placeholder = @"学生学号";
        _studentNo_textField.delegate = self;
        _studentNo_textField.tag = 2;
        
        _studentNo_textField.keyboardType = UIKeyboardTypeDecimalPad;
        _studentNo_textField.font = [UIFont fontWithName:@"Helvetica" size:17];
        [_studentNo_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return _studentNo_textField;
}
-(UIButton *)bingding_button
{
    if (!_bingding_button) {
        _bingding_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _bingding_button.backgroundColor = blue_color;
        _bingding_button.tintColor = [UIColor whiteColor];
        _bingding_button.layer.cornerRadius = 7;
        [_bingding_button setTitle:@"提  交" forState:UIControlStateNormal];
        [_bingding_button addTarget:self action:@selector(bingding) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bingding_button;
}
-(void)bingding{
    NSLog(@"点击了 关系绑定页面 提交按钮");
}
//键盘消失
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag == 1	) {
        if (_studentName_textField.text.length >4) {
            return NO;
        }
    }
    if ([string isEqual:@"\n"]) {
        //编辑结束，键盘消失
        [textField resignFirstResponder];
        return NO;
    }
    
    
    return YES;
}
@end
