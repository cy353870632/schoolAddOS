//
//  HomeWorkView.m
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "HomeWorkView.h"
@interface HomeWorkView()<UITableViewDelegate,UITableViewDataSource>
{
//    HomeWrokTableViewCell * cell;
}
@end
@implementation HomeWorkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //未确认，已确认
        UIButton * twobutton[2];
        for (int i = 0; i < 2; i++) {
            twobutton[i] = [UIButton buttonWithType:UIButtonTypeSystem];
            [twobutton[i] setFrame:CGRectMake(MAINSCREEN.width/2*i,MAINSCREEN.height/10	, MAINSCREEN.width/2,30)];
            [twobutton[i] setTag:i];
            twobutton[i].tintColor = [UIColor blackColor];
            switch (i) {
                case 0:
                    [twobutton[i] setTitle:@"未确认" forState:UIControlStateNormal];
                    break;
                case 1:
                    [twobutton[i] setTitle:@"已确认" forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
            [twobutton[i] addTarget:self action:@selector(TwoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:twobutton[i]];
        }
        self.moveView = [[UIView alloc]initWithFrame:CGRectMake(45,CGRectGetMaxY(twobutton[0].frame), MAINSCREEN.width/2-90, 2)];
        [self.moveView setBackgroundColor:[UIColor colorWithRed:0.231 green:0.678 blue:0.050 alpha:1.000]];
        [self addSubview:self.moveView];
        
        [self addSubview:self.homework_tableview];
        
    }
    return self;
}
-(void)TwoButtonClick:(id)sender
{
     UIButton * button = sender;
    //滚动条的动画显示
    [UIView animateWithDuration:0.3 animations:^{
        [self.moveView setFrame:CGRectMake(button.frame.origin.x+45,CGRectGetMaxY(button.frame), MAINSCREEN.width/2-90,2)];
    }];
}
-(UITableView *)homework_tableview
{
    if (!_homework_tableview) {
        _homework_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.moveView.frame), MAINSCREEN.width, MAINSCREEN.height-25) style:UITableViewStyleGrouped];
        _homework_tableview.layer.cornerRadius = 7;
        _homework_tableview.delegate = self;
        _homework_tableview.dataSource = self;
        [_homework_tableview setSectionFooterHeight:0];
    }
    return _homework_tableview;
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 30;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 6;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
        default:
            return 0;
            break;
    }
    
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   HomeWrokTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HomeWrokTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    cell.noticeType_label.hidden = YES;
    
    return cell;
    
}
//section （标签）标题显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"2016-10-24 周二";
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return MAINSCREEN.height/9;
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.deleget didSelectCell:@"2016-10-24 周四 语文"];
}


@end
