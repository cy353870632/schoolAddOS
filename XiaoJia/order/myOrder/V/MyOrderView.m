//
//  MyOrderView.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "MyOrderView.h"
@interface MyOrderView()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * status_button;
    NSInteger typeStatus;//未过期，已过期的标示
}
@end
@implementation MyOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray * buttonTitle_array = [NSArray arrayWithObjects:@"未过期",@"已过期",@"待支付", nil];
        UIButton * button[3];
        for (int i = 0; i < buttonTitle_array.count; i++) {
            button[i] = [UIButton buttonWithType:UIButtonTypeSystem];
            button[i].frame = CGRectMake(MAINSCREEN.width/3*i, MAINSCREEN.height/11, MAINSCREEN.width/3, MAINSCREEN.height/20);
            if (i == 0) {
                typeStatus = i;
                button[i].tintColor = blue_color;
                status_button = button[i];
            }else{
            button[i].tintColor = Q_gray_color;
            }
            button[i].tag = i;
            button[i].layer.borderColor = blue_color.CGColor;
            button[i].layer.borderWidth = 0.5;
            [button[i] setTitle:buttonTitle_array[i] forState:UIControlStateNormal];
            [self addSubview:button[i]];
            [button[i] addTarget:self action:@selector(orderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:self.order_tablerView];
    }
    return self;
}
-(void)orderButtonClick:(id)sender
{
    UIButton * button = sender;
    NSLog(@"点击了我的订单页的分类button");
    [button setTintColor:blue_color];
    typeStatus = button.tag;
    [status_button setTintColor:Q_gray_color];
    status_button = button;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
            break;
    }
    
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [cell.layer setCornerRadius:10];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [cell.photo_img setImage:[UIImage imageNamed:@"haizeiwang2"]];
    cell.title_label.text = @"数学培训计划";
    cell.description_label.text = @"新教育高中2年级333期数学培训班";
    cell.price_label.text = @"原价：200元";
    cell.time_label.text = @"20课时";
    cell.joinAndComment_label.text = @"优惠信息：平台报名，优惠5折";
    cell.oneClassTime_label.text = @"实付(元)";
    cell.unitPrice_label.text = @"100";
    
    return cell;
    
}
//section （标签）标题显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"订单日起：2016-10-24 周二";
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MAINSCREEN.height/5;
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%ld",(long)indexPath.row);
    [self.delegat didselectSection:indexPath.section Row:indexPath.row TypeStatue:typeStatus];

    
}



-(UITableView *)order_tablerView
{
    if (!_order_tablerView) {
        _order_tablerView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(status_button.frame)+1, MAINSCREEN.width, MAINSCREEN.height-MAINSCREEN.height/12) style:UITableViewStyleGrouped];
        _order_tablerView.delegate = self;
        _order_tablerView.dataSource = self;
        [_order_tablerView setSectionFooterHeight:3];
    }
    return _order_tablerView;
}
@end
