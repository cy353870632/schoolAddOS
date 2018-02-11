//
//  LoginMessageView.m
//  XiaoJia
//
//  Created by 程远 on 17/5/3.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "LoginMessageView.h"
#import "LoginModel.h"
@interface LoginMessageView()<UITextFieldDelegate>{

}
@end
@implementation LoginMessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.back_button];
        [self addSubview:self.type_label];
        [self addSubview:self.uid_label];
        [self addSubview:self.passWord_label];
        [self addSubview:self.uid_field];
        [self addSubview:self.passWord_field];
        [self addSubview:self.forget_label];
        [self addSubview:self.enter_button];
        [self addSubview:self.register_button];
        [self addSubview:self.callUs_button];
        [self addSubview:self.writeUs_button];
        _countDownCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        _countDownCode.frame = CGRectMake(CGRectGetMaxX(self.passWord_field.frame),CGRectGetMaxY(self.uid_label.frame)+20,80, 30);
        [_countDownCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        _countDownCode.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:11];
        _countDownCode.backgroundColor = blue_color;
        _countDownCode.layer.cornerRadius = 7;
        [self addSubview:_countDownCode];
        
        
        [_countDownCode addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
            sender.enabled = NO;
            NSLog(@"hah");
            [sender startWithSecond:20];
            
            [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                _countDownCode.backgroundColor = Q_gray_color;
                NSString *title = [NSString stringWithFormat:@"%d秒",second];
                return title;
            }];
            [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                _countDownCode.backgroundColor = blue_color;
                countDownButton.enabled = YES;
                return @"点击重新获取";
                
            }];
            
        }];

    }
    return self;
}

-(UIButton *)back_button{
    if (!_back_button) {
        _back_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _back_button.frame = CGRectMake(10, 10, 30, MAINSCREEN.height/2.5-20);
        [_back_button setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        _back_button.clipsToBounds = YES;
        [_back_button addTarget:self action:@selector(LoginMessagebackClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back_button;
}
-(UILabel *)type_label{
    if (!_type_label) {
        _type_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, MAINSCREEN.width, 40)];
        [_type_label setTextAlignment:NSTextAlignmentCenter];
        [_type_label setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    }
    return _type_label;
}
-(UILabel *)uid_label{
    if (!_uid_label) {
        _uid_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.back_button.frame)+5, CGRectGetMaxY(self.type_label.frame)+30,50, 20)];
        [_uid_label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    }
    return _uid_label;
}
-(UILabel *)passWord_label{
    if (!_passWord_label) {
        _passWord_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.back_button.frame)+5, CGRectGetMaxY(self.uid_label.frame)+30, 50, 20)];
        [_passWord_label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    }
    return _passWord_label;
}
-(UITextField *)uid_field
{
    if (!_uid_field) {
        _uid_field = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.uid_label.frame)+10, CGRectGetMaxY(self.type_label.frame)+20, MAINSCREEN.width/2, 30)];
        _uid_field.delegate = self;
        _uid_field.tag = 1;
        _uid_field.clearButtonMode=UITextFieldViewModeWhileEditing;
        _uid_field.keyboardType = UIKeyboardTypeNumberPad;
        UIImageView * uid_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, MAINSCREEN.width/2, 0.5)];
        [uid_img setBackgroundColor:[UIColor blackColor]];
        [_uid_field addSubview:uid_img];
    }
    return _uid_field;
}
-(UITextField *)passWord_field
{
    if (!_passWord_field) {
        _passWord_field = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.passWord_label.frame)+10, CGRectGetMaxY(self.uid_label.frame)+20, MAINSCREEN.width/2, 30)];
        _passWord_field.delegate = self;
        _passWord_field.tag = 2;
        _passWord_field.clearButtonMode=UITextFieldViewModeWhileEditing;
        UIImageView * pass_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, MAINSCREEN.width/2, 0.5)];
        [pass_img setBackgroundColor:[UIColor blackColor]];
        [_passWord_field addSubview:pass_img];
    }
    return _passWord_field;
}
-(UIButton *)forget_label{
    if (!_forget_label) {
        _forget_label = [UIButton buttonWithType:UIButtonTypeSystem];
        _forget_label.frame = CGRectMake(CGRectGetMaxX(self.passWord_field.frame)-100, CGRectGetMaxY(self.passWord_field.frame)+10, 100, 20);
        [_forget_label.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        _forget_label.titleLabel.textAlignment = NSTextAlignmentRight;
        [_forget_label setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forget_label addTarget:self action:@selector(forgetPwd) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forget_label;
}
-(UIButton *)enter_button{
    if (!_enter_button) {
        _enter_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _enter_button.frame = CGRectMake(MAINSCREEN.width/6+25, CGRectGetMaxY(self.passWord_field.frame)+60, MAINSCREEN.width/6, MAINSCREEN.width/6);
        _enter_button.layer.cornerRadius =MAINSCREEN.width/12;
        UIImage * buttonImg = [UIImage imageNamed:@"chat_more_icons_camera"];
        buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_enter_button setImage:buttonImg forState:UIControlStateNormal];
        _enter_button.clipsToBounds = YES;
        [_enter_button addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enter_button;
}
-(UIButton *)register_button{
    if (!_register_button) {
        _register_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _register_button.frame = CGRectMake(MAINSCREEN.width*2/3-25, CGRectGetMaxY(self.passWord_field.frame)+60, MAINSCREEN.width/6, MAINSCREEN.width/6);
        _register_button.layer.cornerRadius = MAINSCREEN.width/12;
        UIImage * buttonImg = [UIImage imageNamed:@"chat_more_icons_file"];
        buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [_register_button setImage:buttonImg forState:UIControlStateNormal];
        _register_button.clipsToBounds = YES;
        [_register_button addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _register_button;
}
-(UIButton *)callUs_button{
    if (!_callUs_button) {
        _callUs_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _callUs_button.frame = CGRectMake(MAINSCREEN.width/6+25, CGRectGetMaxY(self.type_label.frame)+60, MAINSCREEN.width/6, MAINSCREEN.width/6);
        _callUs_button.layer.cornerRadius =MAINSCREEN.width/12;
        UIImage * buttonImg = [UIImage imageNamed:@"chat_more_icons_camera"];
        buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_callUs_button setImage:buttonImg forState:UIControlStateNormal];
        _callUs_button.clipsToBounds = YES;
        [_callUs_button addTarget:self action:@selector(callUsClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callUs_button;
}
-(UIButton *)writeUs_button{
    if (!_writeUs_button) {
        _writeUs_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _writeUs_button.frame = CGRectMake(MAINSCREEN.width*2/3-25, CGRectGetMaxY(self.type_label.frame)+60, MAINSCREEN.width/6, MAINSCREEN.width/6);
        _writeUs_button.layer.cornerRadius = MAINSCREEN.width/12;
        UIImage * buttonImg = [UIImage imageNamed:@"chat_more_icons_file"];
        buttonImg = [buttonImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [_writeUs_button setImage:buttonImg forState:UIControlStateNormal];
        _writeUs_button.clipsToBounds = YES;
        [_writeUs_button addTarget:self action:@selector(writeUsClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _writeUs_button;
}
-(void)forgetPwd{
    NSLog(@"商户忘记密码");
}
-(void)enterClick{
    NSLog(@"用户登陆");
    //登录回调
    __weak __typeof(self) weakSelf = self;
    [LoginModel loginRequestSuccess:^(NSDictionary *info) {
    
    }];
}
-(void)registerClick{
    NSLog(@"用户注册");
}
-(void)callUsClick{
    NSLog(@"打电话联系我们");
}
-(void)writeUsClick{
    NSLog(@"留言联系我们");
}
//键盘消失
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag == 1	) {
        if (self.uid_field.text.length >4) {
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

-(void)LoginMessagebackClick
{
    [self.delegat didBackButon];
}
//点击空白，取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}
@end
