//
//  HistoryGradeViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HistoryGradeViewController.h"

@interface HistoryGradeViewController ()<histroyGradedelegat>

@end

@implementation HistoryGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"历史成绩";
    HistoryGradeView * historyGradeView = [[HistoryGradeView alloc]initWithFrame:self.view.bounds];
    historyGradeView.delegat = self;
    [self.view addSubview:historyGradeView];
}
-(void)didseclect:(NSInteger)historyGradeId
{
    HistoryMessageViewController * historyMessageViewController = [[HistoryMessageViewController alloc]init];
    historyMessageViewController.title = @"2017-04-25";
    [self.navigationController pushViewController:historyMessageViewController animated:YES];
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
