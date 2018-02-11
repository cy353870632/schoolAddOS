//
//  HistoryMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/25.
//  Copyright © 2017年 程远. All rights reserved.
// 

#import "HistoryMessageViewController.h"

@interface HistoryMessageViewController ()
{
    HistoryMessageView * historyMessageView;
}
@end

@implementation HistoryMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    historyMessageView = [[HistoryMessageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:historyMessageView];
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
