//
//  GradeBaoGaoView.m
//  XiaoJia
//
//  Created by 程远 on 17/3/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GradeBaoGaoView.h"

@interface GradeBaoGaoView()<UITableViewDelegate,UITableViewDataSource,GradeCeshiViewdelegat,UIAlertViewDelegate>
{
    UILabel * status_label;
    UILabel * youshistatus_label;
    UIAlertView * alertview;
}
@property(nonatomic,strong)GradeListCellTableViewCell * cell;
@property(nonatomic,strong)UIScrollView * groundscroller;
@property(nonatomic,strong)GradeBaoGaoCell * tigao_cell;
@property(nonatomic,strong)GradeBaoGaoCell * youshi_cell;
@end

@implementation GradeBaoGaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该测试是为了更好的检测学生成绩的薄弱知识点，请陪伴孩子认真完成" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"开始", nil];
        
        
        _subject_array = [NSArray arrayWithObjects:@"数学",@"英语",@"语文",@"物理",@"化学", @"物理",@"生物",nil];
        _grade_array = [NSArray arrayWithObjects:@"50",@"120",@"140",@"80",@"100", @"60",@"90",nil];
        _advance_array = [NSArray arrayWithObjects:@"5",@"12",@"3",@"8",@"21", @"6",@"9",nil];
        _advanceImg_array = [NSArray arrayWithObjects:@"1",@"1",@"0",@"1",@"0", @"1",@"0",nil];
        [self addSubview:self.GradeList_tableView];
        [self addSubview:self.notice_label];
        
        NSArray * title_array = [NSArray arrayWithObjects:@"科目",@"平均分",@"班级平均分",@"班级平均名次",@"年级平均分", @"年级平均名次",nil];
        UILabel * title_lable[6];
        for (int i = 0 ; i < 6; i++) {
            title_lable[i] = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/6*i, CGRectGetMaxY(self.notice_label.frame), MAINSCREEN.width/6, 20)];
            
            title_lable[i].text = title_array[i];
            title_lable[i].textAlignment = UITextAlignmentCenter;
            title_lable[i].layer.borderWidth = 1;
            [self addSubview:title_lable[i]];
            status_label = title_lable[i];
            [title_lable[i] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:10]];
        }
        [self addSubview:self.tigao_tableView];
        
        [self addSubview:self.groundscroller];
        GradeCeshiView * gradeCeshiView[3];
        //构建测试单元
        for (int i = 0; i < 3; i++) {
            gradeCeshiView[i] = [[GradeCeshiView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/2.4*i, 0, MAINSCREEN.width/2.45, MAINSCREEN.height/7)];
            [gradeCeshiView[i].title_label setText:@"数学"];
            [gradeCeshiView[i].grade_label setText:@"初中一年级上学期"];
            gradeCeshiView[i].start_button.tag = i;
            gradeCeshiView[i].delegat = self;
            [self.groundscroller addSubview:gradeCeshiView[i]];
        }
        
        
        //提高模块
        [self addSubview:self.notice2_label];
        UILabel * title2_lable[6];
        for (int i = 0 ; i < 6; i++) {
            title2_lable[i] = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/6*i, CGRectGetMaxY(self.notice2_label.frame), MAINSCREEN.width/6, 20)];
            title2_lable[i].text = title_array[i];
            title2_lable[i].textAlignment = UITextAlignmentCenter;
            title2_lable[i].layer.borderWidth = 1;
            [self addSubview:title2_lable[i]];
            youshistatus_label = title2_lable[i];
            [title2_lable[i] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:10]];
        }
        [self addSubview:self.baochi_tableView];
    }
    return self;
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
    if (tableView.tag == 1) {
        return _subject_array.count;
    }else if(tableView.tag == 2)
    {
        return 3;
    
    }else
    {
        return 2;
    }
    
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
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
    }else if (tableView.tag == 2)
    {
        _tigao_cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        _tigao_cell = [[GradeBaoGaoCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [_tigao_cell.layer setCornerRadius:10];
        [_tigao_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        _tigao_cell.subject_lable.text =_subject_array[indexPath.row];
        _tigao_cell.subjectPJF_lable.text = _grade_array[indexPath.row];
        _tigao_cell.classPJF_lable.text = _grade_array[indexPath.row+1];
        _tigao_cell.classNo_label.text = _advance_array[indexPath.row+1];
        _tigao_cell.gradePJF_label.text = _grade_array[indexPath.row+2];
        _tigao_cell.gradeNo_label.text = _advance_array[indexPath.row+2];
        return _tigao_cell;

    }
    else
    {
        _youshi_cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        _youshi_cell = [[GradeBaoGaoCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [_youshi_cell.layer setCornerRadius:10];
        [_youshi_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        _youshi_cell.subject_lable.text =_subject_array[indexPath.row];
        _youshi_cell.subjectPJF_lable.text = _grade_array[indexPath.row];
        _youshi_cell.classPJF_lable.text = _grade_array[indexPath.row+1];
        _youshi_cell.classNo_label.text = _advance_array[indexPath.row+1];
        _youshi_cell.gradePJF_label.text = _grade_array[indexPath.row+2];
        _youshi_cell.gradeNo_label.text = _advance_array[indexPath.row+2];
        return _youshi_cell;
        
    }
    
    
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        return 30;
    }
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//点击了开始测试按钮
-(void)startTest:(NSInteger)index
{
    [alertview show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    NSString *msg = [[NSString alloc] initWithFormat:@"您点击的是第%ld个按钮!",(long)buttonIndex];
    
    NSLog(@"msg:%@",msg);
    
    
    
    if (buttonIndex == 0) {
        
        return;
        
    }else if(buttonIndex == 1){
        NSLog(@"开始测试");
        return;
        
    }
    
}


//懒加载
-(UITableView *)GradeList_tableView
{
    if (!_GradeList_tableView) {
        _GradeList_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN.width, 30*_subject_array.count+6) style:UITableViewStylePlain];
        _GradeList_tableView.delegate = self;
        _GradeList_tableView.dataSource = self;
        _GradeList_tableView.tag = 1;
        _GradeList_tableView.backgroundColor = Q_gray_color;
        [_GradeList_tableView setSectionFooterHeight:3];
        _GradeList_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _GradeList_tableView.showsVerticalScrollIndicator = NO;
    }
    return _GradeList_tableView;
}

-(UITableView *)tigao_tableView
{
    if (!_tigao_tableView) {
        _tigao_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(status_label.frame), MAINSCREEN.width, 20*3+6) style:UITableViewStylePlain];
        _tigao_tableView.delegate = self;
        _tigao_tableView.dataSource = self;
        _tigao_tableView.tag = 2;
        _tigao_tableView.backgroundColor = Q_gray_color;
        [_tigao_tableView setSectionFooterHeight:3];
        _tigao_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tigao_tableView.showsVerticalScrollIndicator = NO;
    }
    return _tigao_tableView;
}
-(UITableView *)baochi_tableView
{
    if (!_baochi_tableView) {
        _baochi_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(youshistatus_label.frame), MAINSCREEN.width, 20*2+6) style:UITableViewStylePlain];
        _baochi_tableView.delegate = self;
        _baochi_tableView.dataSource = self;
        _baochi_tableView.tag = 3;
        _baochi_tableView.backgroundColor = Q_gray_color;
        [_baochi_tableView setSectionFooterHeight:3];
        _baochi_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _baochi_tableView.showsVerticalScrollIndicator = NO;
    }
    return _baochi_tableView;
}
-(UILabel *)notice_label
{
    if (!_notice_label) {
        _notice_label = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(_GradeList_tableView.frame), MAINSCREEN.width-20,60)];
        _notice_label.textColor = [UIColor redColor];
        _notice_label.numberOfLines = 0;
        _notice_label.lineBreakMode = UILineBreakModeCharacterWrap;
        _notice_label.text = @"        系统根据最近3次考试的成绩，认为该学生如下科目需要进行提高，请点击下方对应测试进行深度剖析！";
        [_notice_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _notice_label;
}
-(UIScrollView *)groundscroller
{
    if (!_groundscroller) {
        //成绩测试模块
        _groundscroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tigao_tableView.frame), MAINSCREEN.width, MAINSCREEN.height/6.7)];
        [_groundscroller setContentSize:CGSizeMake(	MAINSCREEN.width/2.4*3,/*这里是横向滚动的长度，想滚动几个图片就是几，也可以是变量。*/  MAINSCREEN.height/7)];//定义内容（滚动试图的）的滚动尺寸大小(滚动时图的宽高)
        [_groundscroller setPagingEnabled:NO];
        _groundscroller.backgroundColor = [UIColor grayColor];
        //设置滚动条是否显示条
        [_groundscroller setShowsVerticalScrollIndicator:NO];//竖项滚动条
    }
    return _groundscroller;
}


-(UILabel *)notice2_label
{
    if (!_notice2_label) {
        _notice2_label = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.groundscroller.frame), MAINSCREEN.width-20,60)];
        _notice2_label.textColor = [UIColor redColor];
        _notice2_label.numberOfLines = 0;
        _notice2_label.lineBreakMode = UILineBreakModeCharacterWrap;
        _notice2_label.text = @"        系统根据最近3次考试的成绩，认为该学生如下科目为优势科目，请注意保持，提高";
        [_notice2_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _notice2_label;
}
@end
