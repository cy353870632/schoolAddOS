//
//  SchoolChooseView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "SchoolChooseView.h"
@interface SchoolChooseView()<UITableViewDelegate,UITableViewDataSource>
{
    ChildChooseTableViewCell * cell;
}
@end

@implementation SchoolChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.schoolChoose_tableview];
    }
    return self;
}
-(UITableView *)schoolChoose_tableview
{
    if (!_schoolChoose_tableview) {
        _schoolChoose_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN.width, MAINSCREEN.height) style:UITableViewStyleGrouped];
        _schoolChoose_tableview.delegate = self;
        _schoolChoose_tableview.dataSource = self;
        _schoolChoose_tableview.sectionFooterHeight = 0;
    }
    return _schoolChoose_tableview;
}
#pragma mark tableView
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 19;
}
//有多少个分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[ChildChooseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier viewSize:self.bounds.size];
    cell.childName_label.hidden = NO;
    cell.childName_label.frame = CGRectMake(17, 10, MAINSCREEN.width, 30);
    cell.childName_label.text = @"厦门第二实验中学";
    return cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegat schoolNameChoose:indexPath.row];
}

@end
