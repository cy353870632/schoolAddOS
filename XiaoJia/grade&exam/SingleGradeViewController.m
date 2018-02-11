//
//  SingleGradeViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/21.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "SingleGradeViewController.h"

@interface SingleGradeViewController ()<payKaoShangdelegat>
{
    NSString * pingyu;
}
@property(strong,nonatomic)KaoShangChooseView * kaoShangChooseView;
@end

@implementation SingleGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@点评",self.grade_array[0]];
    pingyu = @"    你思维敏捷，接受能力较强，课堂上总是很快掌握新知；你热爱学习，总是很快完成作业。你酷爱篮球运动，充满了活力。但你不善于珍惜利用时间，把作业当作任务一样完成，且没有处理好爱好和学习的关系。学习需要刻苦钻研和勇于质疑的精神，还需要执着和孜孜不倦的追求。今后的学习中，你还需端正学习态度，珍惜时间，锁定目标，全力以赴地投入到学知识的海洋中去。唯有如此，你方可到达理想的彼岸！";
    [self.view addSubview:self.grade_label];
    [self.view addSubview:self.advanceimg_label];
    [self.view addSubview:self.teacherName_label];
    [self.view addSubview:self.className_label];
    [self.view addSubview:self.pingyu_label];
    [self.view addSubview:self.kaoshang_img];
    [self.view addSubview:self.notice_label];
    [self.view addSubview:self.kaoShangChooseView];
    
    UIImageView * fenge_img = [[UIImageView alloc]init];
    fenge_img.frame = CGRectMake(0,CGRectGetMaxY(_grade_label.frame), MAINSCREEN.width, 0.8);
    fenge_img.backgroundColor = gray_color;
    [self.view addSubview:fenge_img];
    
    UIImageView * fenge_img2 = [[UIImageView alloc]init];
    fenge_img2.frame = CGRectMake(0,CGRectGetMaxY(_teacherName_label.frame), MAINSCREEN.width, 0.8);
    fenge_img2.backgroundColor = gray_color;
    [self.view addSubview:fenge_img2];
    
    UIImageView * fenge_img3 = [[UIImageView alloc]init];
    fenge_img3.frame = CGRectMake(0,CGRectGetMaxY(_className_label.frame), MAINSCREEN.width, 0.8);
    fenge_img3.backgroundColor = gray_color;
    [self.view addSubview:fenge_img3];
}
-(UILabel *)grade_label
{
    if (!_grade_label) {
        _grade_label = [[UILabel alloc]initWithFrame:CGRectMake(20, MAINSCREEN.height/8, MAINSCREEN.width-40, MAINSCREEN.height/16)];
        _grade_label.text = [NSString stringWithFormat:@"%@              %@                  %@",_grade_array[0],_grade_array[1],_grade_array[3]];
        [_grade_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        
    }
    return _grade_label;
}
-(UILabel *)advanceimg_label
{
    if (!_advanceimg_label) {
        _advanceimg_label = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/2, MAINSCREEN.height/8-3, 20, 50)];
        if ([self.grade_array[2] isEqualToString:@"1"]) {
            _advanceimg_label.textColor = [UIColor redColor];
            _advanceimg_label.text = @"↑";
        }else
        {
            _advanceimg_label.textColor = [UIColor greenColor];
            _advanceimg_label.text = @"↓";
        }
       
        [_advanceimg_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    }
    return _advanceimg_label;
}
-(UILabel *)teacherName_label
{
    if (!_teacherName_label) {
        _teacherName_label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_grade_label.frame)+10, MAINSCREEN.width-40, MAINSCREEN.height/16)];
        _teacherName_label.text = [NSString stringWithFormat:@"点评教师:     王老师"];
        [_teacherName_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    }
    return _teacherName_label;
}
-(UILabel *)className_label
{
    if (!_className_label) {
        _className_label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_teacherName_label.frame)+10, MAINSCREEN.width-40, MAINSCREEN.height/16)];
        _className_label.text = [NSString stringWithFormat:@"任教班级:     一年级1班"];;
        [_className_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    }
    return _className_label;
}
-(UILabel *)pingyu_label
{
    if (!_pingyu_label) {
        _pingyu_label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_className_label.frame)+10, MAINSCREEN.width-40, pingyu.length+10/20*25)];
        _pingyu_label.text = pingyu;
//        _pingyu_label.layer.borderColor = Q_gray_color.CGColor;
//        _pingyu_label.layer.borderWidth = 1;
        _pingyu_label.numberOfLines = 0;
        _pingyu_label.lineBreakMode = NSLineBreakByCharWrapping;
        [_pingyu_label setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        
    }
    return _pingyu_label;
}
-(UIImageView *)kaoshang_img
{
    if (!_kaoshang_img) {
        _kaoshang_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/3, CGRectGetMaxY(_pingyu_label.frame)+10, MAINSCREEN.width-MAINSCREEN.width/1.5, MAINSCREEN.width-MAINSCREEN.width/1.5)];
        [_kaoshang_img setImage:[UIImage imageNamed:@"kaoshang"]];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(kaoshangClick)];
        [_kaoshang_img addGestureRecognizer:tap];
        _kaoshang_img.userInteractionEnabled = YES;
    }
    return _kaoshang_img;
}
-(UILabel *)notice_label
{
    if (!_notice_label) {
        _notice_label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_kaoshang_img.frame)+10, MAINSCREEN.width-40, MAINSCREEN.height/16)];
        _notice_label.text = @"犒赏采取匿名制，用户自愿犒赏点评教师，每期成绩最多可考上一次该教师";
        _notice_label.textColor = [UIColor redColor];
        _notice_label.numberOfLines = 0;
        _notice_label.layer.borderColor = [UIColor redColor].CGColor;
        _notice_label.layer.borderWidth = 1;
        _notice_label.lineBreakMode = NSLineBreakByCharWrapping;
        [_notice_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _notice_label;
}
-(KaoShangChooseView *)kaoShangChooseView
{
    if (!_kaoShangChooseView) {
        _kaoShangChooseView = [[KaoShangChooseView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/10, MAINSCREEN.height/2, MAINSCREEN.width-MAINSCREEN.width/5, 0)];
        _kaoShangChooseView.backgroundColor = Q_gray_color;
        _kaoShangChooseView.kaoshangDelegat = self;
        _kaoShangChooseView.hidden = YES;
    }
    return _kaoShangChooseView;
}
-(void)kaoshangClick
{
    [UIView animateWithDuration:0.6 animations:^{
        [self.kaoShangChooseView setFrame:CGRectMake(MAINSCREEN.width/10,MAINSCREEN.height/3,MAINSCREEN.width-MAINSCREEN.width/5,MAINSCREEN.height/3)];
        _kaoShangChooseView.hidden = NO;
        
    }];
}
-(void)payKaoShang
{
    NSLog(@"确认支付");

}
-(void)cancelKaoShang
{
    [UIView animateWithDuration:1 animations:^{
        [self.kaoShangChooseView setFrame:CGRectMake(MAINSCREEN.width/10,MAINSCREEN.height/2,MAINSCREEN.width-MAINSCREEN.width/5,0)];
    }];
    _kaoShangChooseView.hidden = YES;
    
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
    // P。ass the selected object to the new view controller.
}
*/

@end
