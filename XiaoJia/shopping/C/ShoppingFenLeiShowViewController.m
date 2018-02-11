//
//  ShoppingFenLeiShowViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/6.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShoppingFenLeiShowViewController.h"

@interface ShoppingFenLeiShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
}
@property(strong,nonatomic)ShoppingFenLeiView * shoppingFenLeiView;
@property(strong,nonatomic)ShaiXuanTiaoJianTableViewCell * titlecell;
@end

@implementation ShoppingFenLeiShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self changTitle];
    [self.view addSubview:self.shoppingFenLeiView];
    [self.view addSubview:self.title_tableView];
    
    
}

#pragma mark 懒加载
-(ShoppingFenLeiView *)shoppingFenLeiView
{
    if (!_shoppingFenLeiView) {
        _shoppingFenLeiView = [[ShoppingFenLeiView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width, MAINSCREEN.height)];
        
    }
    return _shoppingFenLeiView;

}
-(UITableView *)title_tableView
{
    if (!_title_tableView) {
        _title_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width,0.0001) style:UITableViewStyleGrouped];
        _title_tableView.delegate = self;
        _title_tableView.dataSource = self;
        [_title_tableView setSectionFooterHeight:1];
        _title_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _title_tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _title_tableView;
}
-(void)changTitle
{
    // 首先定义一个Button
    _title_Button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    // 添加点击方法
    [_title_Button setTintColor:[UIColor whiteColor]];
    [_title_Button setTitle:self.title_label forState:UIControlStateNormal];
    [_title_Button addTarget:self action:@selector(actionButton) forControlEvents:(UIControlEventTouchUpInside)];
    // 自适应大小
    [_title_Button sizeToFit];
    // 添加到 表头 title
    self.navigationItem.titleView = _title_Button;
}

// 实现点击方法
- (void)actionButton
{
    NSLog(@"我是表头, 点击我");
    [UIView animateWithDuration:0.6 animations:^{
        [self.title_tableView setFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width,40*4+10)];
    }];
}


//tableview的代理方法
#pragma mark tableView代理方法
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    return 2;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 4;
    
    
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _titlecell = [[ShaiXuanTiaoJianTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    _titlecell.label.font = [UIFont fontWithName:@"Helvetica" size:16];
    _titlecell.label.text = @"title选择";
        return _titlecell;
    
    
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 40;
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [UIView animateWithDuration:0.6 animations:^{
        [self.title_tableView setFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width,0.0001)];
    }];
    NSLog(@"逛逛分类页筛选title");
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
