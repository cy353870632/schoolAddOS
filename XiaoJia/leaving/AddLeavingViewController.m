//
//  AddLeavingViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "AddLeavingViewController.h"

@interface AddLeavingViewController ()<JGPickerDelegate,UITextFieldDelegate,UITextViewDelegate>
{
    UILabel * title_label;
    UILabel * type_label;
    UILabel * startTime_label;
    UILabel * overTime_label;
    UILabel * data_label;
    UILabel * beizhu_label;
    int date_status;
    int type_status;//0:事假   1:病假   2:其他
    UIButton * typeButton_status;
}
@property(strong,nonatomic)UITextField * title_textField;
@property(strong,nonatomic)UITextField * date_textField;
@property(strong,nonatomic)UITextView * beizhu_textview;
@property (nonatomic,strong)JGPicker  *picker;
@end

@implementation AddLeavingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增请假";
    date_status = 0;
    type_status = 0;
    [self.view addSubview:self.backGround_scroller];
    
    UIBarButtonItem * barbutton = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarStyleDefault target:self action:@selector(fabu)];
    barbutton.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:barbutton];
    
    
    
    title_label = [[UILabel alloc]initWithFrame:CGRectMake(0,0, MAINSCREEN.width, MAINSCREEN.height/11)];
    title_label.layer.borderWidth = 0.5;
    title_label.userInteractionEnabled = YES;
    title_label.layer.borderColor = Q_gray_color.CGColor;
    [title_label setText:@"      标题："];
    title_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.backGround_scroller addSubview:title_label];
    
    //姓名
    _title_textField = [[UITextField alloc]initWithFrame:CGRectMake(MAINSCREEN.width/4, MAINSCREEN.height/11/4,MAINSCREEN.width-MAINSCREEN.width/3.8, MAINSCREEN.height/11/2)];
    _title_textField.placeholder = @"标题内容最好为：xxx病假申请";
    _title_textField.delegate = self;
    _title_textField.font =  [UIFont fontWithName:@"Helvetica" size:14];
    [_title_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [title_label addSubview:_title_textField];
    
    //类型选择
    type_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
    type_label.layer.borderWidth = 0.5;
    type_label.userInteractionEnabled = YES;
    type_label.layer.borderColor = Q_gray_color.CGColor;
    type_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    [type_label setText:@"      类型：              事假              病假              其他"];
    [self.backGround_scroller addSubview:type_label];
    
    UIButton * type_button[3];
    for (int i = 0; i < 3; i++) {
        type_button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
        type_button[i].frame = CGRectMake(MAINSCREEN.width/4.65*(i+1), MAINSCREEN.height/11/5.4, MAINSCREEN.height/11/1.5, MAINSCREEN.height/11/1.5);
        type_button[i].tag = i;
        if (i == 0) {
            [type_button[i] setImage:[UIImage imageNamed:@"icon_selectHight"] forState:UIControlStateNormal];
            typeButton_status = type_button[i];
        }else
        {
            [type_button[i] setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateNormal];
        }
        
        [type_button[i] addTarget:self action:@selector(typeClick:) forControlEvents:UIControlEventTouchUpInside];
        [type_label addSubview:type_button[i]];
    }
    
    
    
    startTime_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(type_label.frame),  MAINSCREEN.width, MAINSCREEN.height/11)];
    startTime_label.layer.borderWidth = 0.5;
    startTime_label.layer.borderColor = Q_gray_color.CGColor;
    startTime_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    [startTime_label setText:@"      开始时间："];
    startTime_label.userInteractionEnabled = YES;
    //开始时间选择按钮
    UIImageView *startTime_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/1.5,  MAINSCREEN.height/11/2.5,  MAINSCREEN.height/11/4,  MAINSCREEN.height/11/4)];
    [startTime_img setImage:[UIImage imageNamed:@"xiala1"]];
    startTime_img.userInteractionEnabled = YES;
    [startTime_label addSubview:startTime_img];
    UITapGestureRecognizer * start_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(startDateChoose)];
    [startTime_img addGestureRecognizer:start_tap];
    [self.backGround_scroller addSubview:startTime_label];
    
    
    overTime_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(startTime_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
    overTime_label.layer.borderWidth = 0.5;
    overTime_label.layer.borderColor = Q_gray_color.CGColor;
    overTime_label.userInteractionEnabled = YES;
    overTime_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    [overTime_label setText:@"      结束时间："];
    
    //结束时间选择按钮
    UIImageView * overTime_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/1.5,  MAINSCREEN.height/11/2.5,  MAINSCREEN.height/11/4,  MAINSCREEN.height/11/4)];
    [overTime_img setImage:[UIImage imageNamed:@"xiala1"]];
    overTime_img.userInteractionEnabled = YES;
    [overTime_label addSubview:overTime_img];
    UITapGestureRecognizer * over_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(overDateChoose)];
    [overTime_img addGestureRecognizer:over_tap];
    [self.backGround_scroller addSubview:overTime_label];
    data_label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(overTime_label.frame), MAINSCREEN.width, MAINSCREEN.height/11)];
    data_label.layer.borderWidth = 0.5;
    data_label.userInteractionEnabled = YES;
    data_label.layer.borderColor = Q_gray_color.CGColor;
    data_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    [data_label setText:@"      总天数：                                   天"];
    [self.backGround_scroller addSubview:data_label];
    //总天数
    _date_textField = [[UITextField alloc]initWithFrame:CGRectMake(MAINSCREEN.width/4, MAINSCREEN.height/11/4.5,MAINSCREEN.width-MAINSCREEN.width/1.4, MAINSCREEN.height/11/2)];
    _date_textField.placeholder = @"请填写天数";
    _date_textField.delegate = self;
    _date_textField.font = type_label.font = [UIFont fontWithName:@"Helvetica" size:14];
    _date_textField.keyboardType = UIKeyboardTypeDecimalPad;//键盘样式，数字键盘
    _date_textField.tag = 2;
    [_date_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [data_label addSubview:_date_textField];
    
    
    _beizhu_textview = [[UITextView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/20,CGRectGetMaxY(data_label.frame),MAINSCREEN.width-MAINSCREEN.width/10, MAINSCREEN.height/3)];
    [_beizhu_textview setBackgroundColor:[UIColor whiteColor]];
    [_beizhu_textview setFont:[UIFont systemFontOfSize:16]];
    _beizhu_textview.text = @"备注信息";
//    _beizhu_textview.layer.borderWidth = 0.8;
    _beizhu_textview.textColor = [UIColor grayColor];
//    _beizhu_textview.layer.borderColor = Q_gray_color.CGColor;
    _beizhu_textview.delegate = self;
    [self.backGround_scroller addSubview:_beizhu_textview];
    
    
    //日期选择
    _picker = [[JGPicker alloc] initWithFrame:self.view.frame type:UIDatePickerModeDateAndTime andDelegate:self];
    _picker.hidden = YES;
    [self.view addSubview:_picker];
   
}
//发布
-(void)fabu
{
    NSLog(@"家长发布请假");
}
//类型选择
-(void)typeClick:(id)sender
{
    UIButton * button = sender;
    type_status = (int)button.tag;
    [typeButton_status setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_selectHight"] forState:UIControlStateNormal];
    typeButton_status = button;
}

//开始时间选择
-(void)startDateChoose{
    _picker.hidden = NO;
    date_status = 1;
    [_picker show];
}
//结束时间选择
-(void)overDateChoose{
    _picker.hidden = NO;
    date_status = 2;
     [_picker show];
}
//textview的假提示
- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self backGroundScrollerUP];
    if ([textView.text isEqualToString:@"备注信息"]) {
        textView.text = @"";
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.text = @"备注信息";
        textView.textColor = [UIColor grayColor];
    }else
    {
        textView.textColor = [UIColor blackColor];
    }
    [self backGroundScrollerDown];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView.textColor == [UIColor grayColor]) {
        textView.textColor = [UIColor blackColor];
    }else
    {
        textView.textColor = [UIColor grayColor];
    }
    textView.textColor = [UIColor blackColor];
    if ([text isEqual:@"\n"]) {
        //编辑结束，键盘消失
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
    
}
//键盘消失
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag == 2) {
        if (_date_textField.text.length >2) {
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
#pragma mark - 日期选择 - JGPickerDelegate
- (void)changeTime:(NSDate *)date
{
    NSLog(@"开始时间选择了:%@",[_picker stringFromDate:date]);
}

- (void)determinSelected:(NSDate *)date
{
    if (date_status == 1) {
        [startTime_label setText:[NSString stringWithFormat:@"      开始时间：      %@",[_picker stringFromDate:date]]];
    }else
    {
        [overTime_label setText:[NSString stringWithFormat:@"      结束时间：      %@",[_picker stringFromDate:date]]];
    }
    _picker.hidden = YES;
    NSLog(@"最终选择了:%@",[_picker stringFromDate:date]);
}

-(UIScrollView *)backGround_scroller
{
    if (!_backGround_scroller) {
        _backGround_scroller = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        [_backGround_scroller setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height)];
        [_backGround_scroller setShowsHorizontalScrollIndicator:NO];
        [_backGround_scroller setShowsVerticalScrollIndicator:NO];
        UITapGestureRecognizer * backGround_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backGroundTouch)];
        [_backGround_scroller addGestureRecognizer:backGround_tap];
//        _backGround_scroller.scrollEnabled = NO;
    }
    return _backGround_scroller;
}
-(void)backGroundScrollerUP{
//    _backGround_scroller.userInteractionEnabled = YES;
    [_backGround_scroller setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height*1.5)];
    [UIView animateWithDuration:0.6 animations:^{
        [_backGround_scroller setFrame:CGRectMake(0,-MAINSCREEN.height/4,MAINSCREEN.width,MAINSCREEN.height*2)];
    }];
}
-(void)backGroundScrollerDown{
//    _backGround_scroller.userInteractionEnabled = NO;
    [_backGround_scroller setContentSize:CGSizeMake(MAINSCREEN.width, MAINSCREEN.height)];
    [UIView animateWithDuration:0.6 animations:^{
        [_backGround_scroller setFrame:self.view.bounds];
    }];
}

-(void)backGroundTouch
{
    [self.view endEditing:YES];
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
