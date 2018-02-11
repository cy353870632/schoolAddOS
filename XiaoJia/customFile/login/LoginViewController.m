//
//  LoginViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/26.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<LoginTypeViewDelegat,LoginMessageViewDelegat>
{
    UIImageView * Logo_imgeview;
}
@property(strong,nonatomic)LoginTypeView * loginTypeView;
@property(strong,nonatomic)LoginMessageView * loginMessageView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    Logo_imgeview = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/4, MAINSCREEN.height/10, MAINSCREEN.width/2, MAINSCREEN.width/2)];
    [Logo_imgeview.layer setCornerRadius:MAINSCREEN.width/4];
    Logo_imgeview.clipsToBounds = YES;
    [Logo_imgeview setImage:[UIImage imageNamed:@"xiao+Logo"]];
    [self.view addSubview:Logo_imgeview];
    
    self.loginTypeView = [[LoginTypeView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(Logo_imgeview.frame)+40, MAINSCREEN.width, MAINSCREEN.height/2.5) LogoHeight:CGRectGetMaxY(Logo_imgeview.frame)];
    self.loginTypeView.delegat = self;
    [self.view addSubview:self.loginTypeView];
    
    self.loginMessageView = [[LoginMessageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width,CGRectGetMaxY(Logo_imgeview.frame)+20, MAINSCREEN.width, MAINSCREEN.height/2.5)];
    self.loginMessageView.delegat = self;
    [self.view addSubview:self.loginMessageView];
}

-(void)didselect:(NSInteger)index
{
    
    switch (index) {
        case 0:
            [self.loginMessageView.type_label setText:@"家长登录"];
            self.loginMessageView.typeStatus = @"0";
            [self.loginMessageView.uid_label setText:@"手机号"];
            [self.loginMessageView.passWord_label setText:@"验证码"];
            self.loginMessageView.uid_field.placeholder = @"请输入手机号";
            self.loginMessageView.passWord_field.placeholder = @"请输入验证码";
            [self showUI];
            break;
        case 1:
            [self.loginMessageView.type_label setText:@"教师登录"];
            self.loginMessageView.typeStatus = @"1";
            [self.loginMessageView.uid_label setText:@"手机号"];
            [self.loginMessageView.passWord_label setText:@"验证码"];
            self.loginMessageView.uid_field.placeholder = @"请输入手机号";
            self.loginMessageView.passWord_field.placeholder = @"请输入验证码";
            [self showUI];
            break;
        case 2:
            [self.loginMessageView.type_label setText:@"商户登录"];
            self.loginMessageView.typeStatus = @"2";
            [self.loginMessageView.uid_label setText:@"商户码"];
            [self.loginMessageView.passWord_label setText:@"密  码"];
            self.loginMessageView.uid_field.placeholder = @"请输入商户码";
            self.loginMessageView.passWord_field.placeholder = @"请输入密码";
            [self showUI];
            self.loginMessageView.countDownCode.hidden = YES;
            self.loginMessageView.forget_label.hidden = NO;
            break;
        default:
            [self.loginMessageView.type_label setText:@"联系我们"];
            self.loginMessageView.typeStatus = @"4";
            [self hiddenUI];
            break;
    }
    [UIView animateWithDuration:0.6 animations:^{
        self.loginTypeView.frame = CGRectMake(-MAINSCREEN.width,CGRectGetMaxY(Logo_imgeview.frame)+40, MAINSCREEN.width, MAINSCREEN.height/2.5);
        self.loginMessageView.frame = CGRectMake(0,CGRectGetMaxY(Logo_imgeview.frame)+20, MAINSCREEN.width, MAINSCREEN.height/2.5);
    }];
}
-(void)didBackButon
{
    [UIView animateWithDuration:0.6 animations:^{
        self.loginTypeView.frame = CGRectMake(0,CGRectGetMaxY(Logo_imgeview.frame)+40, MAINSCREEN.width, MAINSCREEN.height/2.5);
        self.loginMessageView.frame = CGRectMake(MAINSCREEN.width,CGRectGetMaxY(Logo_imgeview.frame)+20, MAINSCREEN.width, MAINSCREEN.height/2.5);
    }];
}
-(void)showUI{
    self.loginMessageView.uid_label.hidden = NO;
    self.loginMessageView.passWord_label.hidden = NO;
    self.loginMessageView.uid_field.hidden = NO;
    self.loginMessageView.passWord_field.hidden = NO;
    self.loginMessageView.countDownCode.hidden = NO;
    self.loginMessageView.forget_label.hidden = YES;
    self.loginMessageView.enter_button.hidden = NO;
    self.loginMessageView.register_button.hidden = NO;
    self.loginMessageView.callUs_button.hidden = YES;
    self.loginMessageView.writeUs_button.hidden = YES;
}
-(void)hiddenUI{
    self.loginMessageView.uid_label.hidden = YES;
    self.loginMessageView.passWord_label.hidden = YES;
    self.loginMessageView.uid_field.hidden = YES;
    self.loginMessageView.passWord_field.hidden = YES;
    self.loginMessageView.countDownCode.hidden = YES;
    self.loginMessageView.forget_label.hidden = YES;
    self.loginMessageView.enter_button.hidden = YES;
    self.loginMessageView.register_button.hidden = YES;
    self.loginMessageView.callUs_button.hidden = NO;
    self.loginMessageView.writeUs_button.hidden = NO;
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
