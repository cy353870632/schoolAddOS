//
//  MyOrderViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "MyOrderViewController.h"

@interface MyOrderViewController ()<MyOrderDelegat>
@property(strong,nonatomic)MyOrderView * myorderView;
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    [self.view addSubview:self.myorderView];
}
-(MyOrderView *)myorderView
{
    if (!_myorderView) {
        _myorderView = [[MyOrderView alloc]initWithFrame:self.view.bounds];
        _myorderView.delegat = self;
    }
    return _myorderView;
}
-(void)didselectSection:(NSInteger)section Row:(NSInteger)index TypeStatue:(NSInteger)type
{
    MyOrderMessageViewController * myOrderMessageViewController = [[MyOrderMessageViewController alloc]init];
    [self.navigationController pushViewController:myOrderMessageViewController animated:YES];
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
