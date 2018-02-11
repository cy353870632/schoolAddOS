//
//  BasicsMessageView.m
//  XiaoJia
//
//  Created by 程远 on 17/3/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "BasicsMessageView.h"
@interface BasicsMessageView()<studentBangDingDelegat>
{
    UIImageView * groundView1;
    UIScrollView * groundscroller;
}
@property(strong,nonatomic)EWMView * erweima_view;
@end
@implementation BasicsMessageView
/**
 * studentNo 绑定学生的个数
 */
- (instancetype)initWithFrame:(CGRect)frame withStudentNo:(NSInteger)studentNo
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:Q_gray_color];
        self.userInteractionEnabled = YES;
        [self initUI:studentNo];
        
        //个人头像
        UIImageView * person_img = [[UIImageView alloc]initWithFrame:CGRectMake((MAINSCREEN.width-100)/2, 10,100, 100)];
        person_img.image = [UIImage imageNamed:@"haizeiwang2"];
        person_img.layer.cornerRadius = 50;
        person_img.clipsToBounds = YES;
        person_img.userInteractionEnabled = YES;
        [groundView1 addSubview:person_img];
        
        //个人昵称
        UILabel * nikeName = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(person_img.frame)+3, MAINSCREEN.width, MAINSCREEN.height/2.5/2/3)];
        [nikeName setText:@"昵称：我的昵称"];
        nikeName.textAlignment = NSTextAlignmentCenter;
        [groundView1 addSubview:nikeName];
        //个人真实姓名
        UILabel * realName = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nikeName.frame)+3, MAINSCREEN.width, MAINSCREEN.height/2.5/2/3)];
        [realName setText:@"姓名：我的真实姓名"];
        realName.textAlignment = NSTextAlignmentCenter;
        [groundView1 addSubview:realName];
        //个人手机号
        UILabel * phoneNo = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(realName.frame)+3, MAINSCREEN.width, MAINSCREEN.height/2.5/2/3)];
        [phoneNo setText:@"电话：＊＊＊＊＊＊＊4266"];
        phoneNo.textAlignment = NSTextAlignmentCenter;
        [groundView1 addSubview:phoneNo];
        
        
        for (int i = 0; i < studentNo; i++) {
            BasicsMessageStudentBangdingView * view = [[BasicsMessageStudentBangdingView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/2.4 * i , 0, MAINSCREEN.width/2.45, MAINSCREEN.height/4)];
            view.cancelBangDing_button.tag = i;
            view.delegat = self;
            [groundscroller addSubview:view];
        }
        
        [self addSubview:self.erweima_view];
        
    }
    return self;
}
-(void)cancelBangDing:(NSInteger)index
{
    NSLog(@"解除绑定了第 %ld 个学生",(long)index);
    [self.delegat cancelBingDing:index];
}
-(void)initUI:(NSInteger)studentNo{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, MAINSCREEN.height/8.5, MAINSCREEN.width/2, 10)];
    [label setText:@"个人资料"];
    [self addSubview:label];
    groundView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame)+10, MAINSCREEN.width, MAINSCREEN.height/2.5)];
    groundView1.backgroundColor = [UIColor whiteColor];
    groundView1.userInteractionEnabled = YES;
    [self addSubview:groundView1];
    
    UILabel * erweima = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(groundView1.frame)+3, MAINSCREEN.width, MAINSCREEN.height/11)];
    erweima.backgroundColor = [UIColor whiteColor];
    [erweima setText:@"我的二维码"];
    erweima.userInteractionEnabled = YES;
    erweima.textAlignment = NSTextAlignmentCenter;
    [self addSubview:erweima];
    UITapGestureRecognizer * erweima_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(erweimaHidden)];
    [erweima addGestureRecognizer:erweima_tap];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(erweima.frame)+10, MAINSCREEN.width/2, 20)];
    [label2 setText:@"绑定情况"];
    [self addSubview:label2];
    
    groundscroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label2.frame)+10, MAINSCREEN.width, MAINSCREEN.height/4)];
    [groundscroller setContentSize:CGSizeMake(	MAINSCREEN.width/2.4*studentNo,/*这里是横向滚动的长度，想滚动几个图片就是几，也可以是变量。*/  MAINSCREEN.height/4)];//定义内容（滚动试图的）的滚动尺寸大小(滚动时图的宽高)
    [groundscroller setPagingEnabled:NO];
    groundscroller.backgroundColor = [UIColor grayColor];
    //设置滚动条是否显示条
    [groundscroller setShowsVerticalScrollIndicator:NO];//竖项滚动条
    [self addSubview:groundscroller];
    
}

-(void)erweimaHidden
{
    NSLog(@"点击了我的二维码");
    self.erweima_view.hidden = NO;
}
-(EWMView *)erweima_view
{
    //生成我的二维码
    if (!_erweima_view) {
        _erweima_view = [[EWMView alloc]initWithFrame:CGRectMake((MAINSCREEN.width-(MAINSCREEN.width/2+80))/2, (MAINSCREEN.height - (MAINSCREEN.width/2+80))/2, MAINSCREEN.width/2+80, MAINSCREEN.width/2+80) withURL:@"www.baidu.com"];
        _erweima_view.hidden = YES;
    }
    return _erweima_view;
}

//点击空白，取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
    self.erweima_view.hidden = YES;
}
@end
