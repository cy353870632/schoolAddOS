//
//  HistoryGradeView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HistoryGradeView.h"
@interface HistoryGradeView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation HistoryGradeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.historyGrade_tableview];
    }
    return self;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
    
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryGradeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HistoryGradeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [cell.layer setCornerRadius:10];
    [cell.date_label setText:@"2017-04-25"];
    [cell.grade_label setText:@"一年级1班"];
    [cell.classNo_label setText:@"4"];
    [cell.gradeNo_label setText:@"20"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MAINSCREEN.height/8;
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    [self.deleget didSelectCell:@"2016-10-24 周四 语文"];
    [self.delegat didseclect:indexPath.section];
}
-(UITableView *)historyGrade_tableview
{
    if (!_historyGrade_tableview) {
        _historyGrade_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/10, MAINSCREEN.width, MAINSCREEN.height-MAINSCREEN.height/12) style:UITableViewStyleGrouped];
        _historyGrade_tableview.delegate = self;
        _historyGrade_tableview.dataSource = self;
        [_historyGrade_tableview setSectionFooterHeight:3];
    }
    return _historyGrade_tableview;
}
@end
