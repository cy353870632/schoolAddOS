//
//  CancelBingDIngView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CancelBingDIngView.h"
@interface CancelBingDIngView()<UITextFieldDelegate>
{
    UILabel * tishi_label;//标题label
    UIImageView * fenge_img;//分割线
}
@end
@implementation CancelBingDIngView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage * back_img = [UIImage imageNamed:@"iconfont-guanbi"];
        //原图展示
        back_img = [back_img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.back_button = [UIButton buttonWithType:UIButtonTypeSystem];
        self.back_button.frame = CGRectMake(20, MAINSCREEN.height/20, MAINSCREEN.width/7,  MAINSCREEN.width/7);
        [self.back_button setImage:back_img forState:UIControlStateNormal];
        [self addSubview:self.back_button];
        
        tishi_label =[[UILabel alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/3, MAINSCREEN.width, MAINSCREEN.height/12)];
        tishi_label.text = @"          学号：";
        tishi_label.userInteractionEnabled = YES;
        [self addSubview:tishi_label];
        self.studentNo_textField.frame = CGRectMake(MAINSCREEN.width/3.3, 0, MAINSCREEN.width/2, MAINSCREEN.height/12);
        [tishi_label addSubview:self.studentNo_textField];
        
        fenge_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tishi_label.frame)+5, MAINSCREEN.width, 1)];
        fenge_img.backgroundColor = Q_gray_color;
        [self addSubview:fenge_img];
        
        self.enter_button.frame = CGRectMake(MAINSCREEN.width/3, CGRectGetMaxY(fenge_img.frame)+20, MAINSCREEN.width - MAINSCREEN.width/1.5, MAINSCREEN.height/18);
        [self addSubview:self.enter_button];
        
        
        
    }
    return self;
}
-(UITextField *)studentNo_textField
{
    if (!_studentNo_textField) {
        _studentNo_textField = [[UITextField alloc]init];
        _studentNo_textField.delegate = self;
        _studentNo_textField.tag = 1;
        _studentNo_textField.keyboardType = UIKeyboardTypeNumberPad;
        _studentNo_textField.placeholder = @"请输入该学生学号";
    }
    return _studentNo_textField;
}
-(UITextField *)phone_textField
{
    if (!_phone_textField) {
        _phone_textField = [[UITextField alloc]init];
        _phone_textField.frame = CGRectMake(MAINSCREEN.width/3.3, 0, MAINSCREEN.width/2, MAINSCREEN.height/12);
        _phone_textField.delegate = self;
        _phone_textField.tag = 1;
        _phone_textField.keyboardType = UIKeyboardTypeNumberPad;
        _phone_textField.placeholder = @"请验证手机号";
    }
    return _phone_textField;
}
-(UITextField *)yanzheng_textField
{
    if (!_yanzheng_textField) {
        _yanzheng_textField = [[UITextField alloc]init];
        _yanzheng_textField.frame = CGRectMake(MAINSCREEN.width/3.3, CGRectGetMaxY(tishi_label.frame)+10, MAINSCREEN.width/4, MAINSCREEN.height/12);
        _yanzheng_textField.delegate = self;
        _yanzheng_textField.tag = 1;
        _yanzheng_textField.keyboardType = UIKeyboardTypeNumberPad;
        _yanzheng_textField.placeholder = @"输入验证码";
    }
    return _yanzheng_textField;
}
-(UIButton *)yanzheng_button
{
    if(!_yanzheng_button){
        _yanzheng_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _yanzheng_button.frame = CGRectMake(CGRectGetMaxX(_yanzheng_textField.frame)+20,CGRectGetMaxY(tishi_label.frame)+20, MAINSCREEN.width/4, MAINSCREEN.height/18);
        [_yanzheng_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        _yanzheng_button.backgroundColor = blue_color;
        _yanzheng_button.tintColor = [UIColor whiteColor];
        _yanzheng_button.layer.cornerRadius = 7;
    }
    return _yanzheng_button;
}
-(UIButton *)enter_button
{
    if(!_enter_button){
        _enter_button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_enter_button setTitle:@"验  证" forState:UIControlStateNormal];
        _enter_button.backgroundColor = blue_color;
        _enter_button.tintColor = [UIColor whiteColor];
        _enter_button.layer.cornerRadius = 7;
        [_enter_button addTarget:self action:@selector(yanzheng:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enter_button;
}

-(void)yanzheng:(id)sender{
    UIButton * button = sender;
    if ([button.titleLabel.text isEqualToString:@"验  证"]) {
        NSLog(@"解除绑定 验证学号");
        //只有学号验证过了，才会有验证手机接触绑定
        tishi_label.text = @"          手机号：";
        self.studentNo_textField.hidden = YES;
        [tishi_label addSubview:self.phone_textField];
        [self addSubview:self.yanzheng_textField];
        [self addSubview:self.yanzheng_button];
        UIImageView * fenge2_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.yanzheng_textField.frame)+5, MAINSCREEN.width, 1)];
        fenge2_img.backgroundColor = Q_gray_color;
        [self addSubview:fenge2_img];
         [_enter_button setTitle:@"确认解除" forState:UIControlStateNormal];
        self.enter_button.frame = CGRectMake(MAINSCREEN.width/3, CGRectGetMaxY(fenge2_img.frame)+20, MAINSCREEN.width - MAINSCREEN.width/1.5, MAINSCREEN.height/18);

    }else{
        NSLog(@"解除绑定 验证手机 确认解除");
    }
    
}
//键盘消失
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag == 1	) {
        if (_studentNo_textField.text.length >4) {
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
