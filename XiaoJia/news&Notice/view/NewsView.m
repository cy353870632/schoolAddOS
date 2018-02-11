//
//  NewsView.m
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "NewsView.h"

@interface NewsView()<UITableViewDelegate,UITableViewDataSource>
{
    NewsTableViewCell * cell;
}
@end
@implementation NewsView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self addSubview:self.newsTableview];
        self.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:244.0/255.0 alpha:1];
        
        
        
        
    }
    return self;
}

-(UITableView *)newsTableview
{
    if (!_newsTableview) {
        _newsTableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, MAINSCREEN.width-20, MAINSCREEN.height-MAINSCREEN.height/7.5) style:UITableViewStyleGrouped];
        _newsTableview.layer.cornerRadius = 7;
        _newsTableview.delegate = self;
        _newsTableview.dataSource = self;
        [_newsTableview setSectionFooterHeight:25];
        _newsTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _newsTableview.showsVerticalScrollIndicator = NO;
//        [_newsTableview addHeaderWithTarget:self action:@selector(headRefresh:)];
//        [_newsTableview addFooterWithTarget:self action:@selector(footRefresh:)];
    }
    return _newsTableview;
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 25;
    }
    return 0.001;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;

}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    [cell.layer setCornerRadius:10];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row == 0) {
        cell.news_ImgSamll.hidden = YES;
        cell.news_labelSmall.hidden = YES;
    }else
    {
        cell.news_ImgBig.hidden = YES;
        cell.news_labelBig.hidden = YES;
    }
    return cell;
    
}
//section （标签）标题显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"2016-10-24";
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return MAINSCREEN.height/4;
    }else
    {
        return MAINSCREEN.height/9;
    }
    
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
