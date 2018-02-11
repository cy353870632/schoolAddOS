//
//  LeavingViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/28.
//  Copyright © 2017年 程远. All rights reserved.
//请假

#import "LeavingViewController.h"

@interface LeavingViewController ()<selectLeavingCellDeleget>
@property(strong,nonatomic)LeavingView * leavingView;
@end

@implementation LeavingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"请假";
    [self.view addSubview:self.leavingView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTintColor:[UIColor whiteColor]];
//    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [btn addTarget:self action:@selector(addLeaving) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}
-(void)addLeaving
{
    NSLog(@"新增请假");
    AddLeavingViewController * addLeavingViewController = [[AddLeavingViewController alloc]init];
    [self.navigationController pushViewController:addLeavingViewController animated:YES];
}

/*
 *加载控件
 */
-(LeavingView *)leavingView
{
    if (!_leavingView) {
        _leavingView = [[LeavingView alloc]initWithFrame:self.view.bounds];
        _leavingView.deleget = self;
    }
    return _leavingView;
}

/*
 *点击cell跳转
 */
-(void)didSelectCell:(NSInteger)index
{
    NSLog(@"点击了第 %ld 条请假",(long)index);
    LeavingMessageViewController * leavingMessageViewController = [[LeavingMessageViewController alloc]init];
    leavingMessageViewController.title = @"2016-07-01";
    [self.navigationController pushViewController:leavingMessageViewController animated:YES];
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

