//
//  HistoryMessageView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/25.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HistoryMessageView.h"
#import "WYPieChartView.h"
@interface HistoryMessageView ()<WYPieChartViewDelegate,WYPieChartViewDatasource,UITableViewDelegate,UITableViewDataSource>
{
    Marquee * paomav;
}
@property(strong,nonatomic)WYPieChartView * pieView;
@property(strong,nonatomic)UIImageView * classPaiMing_img;
@property(nonatomic,strong)GradeListCellTableViewCell * cell;
@end
@implementation HistoryMessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //跑马
//        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(10,0,MAINSCREEN.width-20,35)];
//        label1.text = @"暂时没有考试安排，当前成绩为 3 月 24 号考成成绩";
//        label1.textColor = red_color;
//        label1.font = [UIFont fontWithName:@"Helvetica" size:14];
//        paomav = [[Marquee alloc] initWithFrame:CGRectMake(10,3, MAINSCREEN.width,25)];
//        paomav.margin = 0;
//        [paomav fire];
//        paomav.isSingle = YES;
//        paomav.views = [NSMutableArray arrayWithArray:@[label1]];
//        [self addSubview:paomav];
        
        
        [self initShanXingTU];
        [self addSubview:self.gradeBaoGao_button];
        [self addSubview:self.liShiShuJu_button];
        [self addSubview:self.classPaiMing_img];
        [self addSubview:self.GradeList_tableView];
//        [self addSubview:self.notice_label];
//        [self addSubview:self.peiXunViewForGradeView];
        
    }
    return self;
}
-(void)initShanXingTU
{
    _colors = [NSArray arrayWithObjects:[UIColor colorWithRed:0.800 green:0.472 blue:0.100 alpha:1.000],[UIColor colorWithRed:0.200 green:0.472 blue:0.400 alpha:1.000],[UIColor colorWithRed:0.600 green:0.472 blue:0.600 alpha:1.000],[UIColor colorWithRed:0.200 green:0.472 blue:1.000 alpha:1.000],Q_gray_color,[UIColor colorWithRed:0.600 green:0.372 blue:0.100 alpha:1.000],
               [UIColor colorWithRed:0.800 green:0.872 blue:0.300 alpha:1.000],nil];
    //这个color是label的背景颜色，黑色的表示教师还没有评论的，绿色的表示评论了的
    _labelBackgroundColor = [NSArray arrayWithObjects:green_color,[UIColor colorWithWhite:0.888 alpha:1.000],[UIColor colorWithWhite:0.888 alpha:1.000],green_color,[UIColor colorWithWhite:0.888 alpha:1.000],green_color,green_color, nil];
    _subject_array = [NSArray arrayWithObjects:@"数学",@"英语",@"语文",@"物理",@"化学", @"物理",@"生物",nil];
    _grade_array = [NSArray arrayWithObjects:@"50",@"120",@"140",@"80",@"100", @"60",@"90",nil];
    _advance_array = [NSArray arrayWithObjects:@"5",@"12",@"3",@"8",@"21", @"6",@"9",nil];
    _advanceImg_array = [NSArray arrayWithObjects:@"1",@"1",@"0",@"1",@"0", @"1",@"0",nil];
    _pieView = [[WYPieChartView alloc] initWithFrame:CGRectMake(40, 0, MAINSCREEN.width-80, MAINSCREEN.width-80)];
    _pieView.delegate = self;
    _pieView.datasource = self;
    _pieView.showInnerCircle = YES;//中间缺一块
    
    _pieView.fillByGradient = NO;//不展示全覆盖的
    _pieView.style = kWYPieChartNormalStyle/kWYPieChartGearStyle;
    _pieView.rotatable = NO;//不允许转动
    _pieView.selectedStyle = kWYPieChartSectorSelectedExtraction;
    _pieView.values = @[@50, @120, @140, @80, @100, @60, @90];
    
    [self addSubview:_pieView];
    [_pieView update];
    _pieView.labelsTextColor = [UIColor blackColor];
}
-(UIImageView *)classPaiMing_img
{
    if (!_classPaiMing_img) {
        //iphone6尺寸
        _classPaiMing_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/2.4-3, CGRectGetMidY(_pieView.frame)-34, MAINSCREEN.width/6+5.8, MAINSCREEN.width/6+5.8)];
        [_classPaiMing_img setImage:[UIImage imageNamed:@"classPaiMing"]];
        
        UILabel * paiming_label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 30, 50)];
        paiming_label.text = @"21";
        paiming_label.textColor = [UIColor whiteColor];
        //        paiming_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        paiming_label.font = [UIFont boldSystemFontOfSize:25];
        [_classPaiMing_img addSubview:paiming_label];
    }
    return _classPaiMing_img;
}
- (NSInteger)pieChartView:(WYPieChartView *)pieChartView valueIndexReferToLabelAtIndex:(NSInteger)index{
    return 100;
}
//每个扇形的文字描述
- (NSString *)pieChartView:(WYPieChartView *)pieChartView textForLabelAtIndex:(NSInteger)index{
    if (index==3 || index == 1) {
        _pieView.labelsTextColor = [UIColor greenColor];
    }
    NSString * pieText = [NSString stringWithFormat:@"%@,%@",_subject_array[index],_grade_array[index]];
    return pieText;
}
//每个描述label的背景颜色
- (UIColor *)pieChartView:(WYPieChartView *)pieChartView labelColorAtIndex:(NSInteger)index{
    return _labelBackgroundColor[index];
}
//每个扇形的颜色分类
- (UIColor *)pieChartView:(WYPieChartView *)pieChartView sectorColorAtIndex:(NSInteger)index{
    return _colors[index];
}
//有多少个label
- (NSInteger)numberOfLabelOnPieChartView:(WYPieChartView *)pieChartView
{
    return _subject_array.count;
}
//点击每个扇形，进入单科点评页面
- (void)pieChartView:(WYPieChartView *)pieChartView didSelectedSectorAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
//    [self.selectWYCdelegate didselectWYChart:index subject:self.subject_array[index] grade:self.grade_array[index] advanceStatus:self.advanceImg_array[index] advance:self.advance_array[index]] ;
}
-(UITableView *)GradeList_tableView
{
    if (!_GradeList_tableView) {
        _GradeList_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pieView.frame)+4, MAINSCREEN.width, 40*_subject_array.count+6) style:UITableViewStylePlain];
        _GradeList_tableView.delegate = self;
        _GradeList_tableView.dataSource = self;
        _GradeList_tableView.backgroundColor = Q_gray_color;
        [_GradeList_tableView setSectionFooterHeight:3];
        _GradeList_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _GradeList_tableView.showsVerticalScrollIndicator = NO;
    }
    return _GradeList_tableView;
}
#pragma mark tableView
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subject_array.count;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    _cell = [[GradeListCellTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    [_cell.layer setCornerRadius:10];
    [_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    _cell.subject_lable.text =_subject_array[indexPath.row];
    _cell.grade_lable.text = _grade_array[indexPath.row];
    
    if ([_advanceImg_array[indexPath.row] isEqualToString:@"1"]) {
        _cell.ascent_img.hidden = YES;
        _cell.duibi_lable.text = _advance_array[indexPath.row];
    }else
    {
        _cell.regress_img.hidden = YES;
        _cell.duibi_lable.text = _advance_array[indexPath.row];
    }
    _cell.average_label.text = @"班级平均分：100";
    return _cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
