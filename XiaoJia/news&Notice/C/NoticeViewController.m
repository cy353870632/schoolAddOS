//
//  NoticeViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/21.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()<noticeViewDelegat>

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通知列表";
    
    NoticeView * noticeView = [[NoticeView alloc]initWithFrame:self.view.bounds];
    noticeView.deleget = self;
    [self.view addSubview:noticeView];
    
}
-(void)didselectNotice:(NSInteger)noticeId
{
    NoticeMessageViewController * noticeMessageViewController = [[NoticeMessageViewController alloc]init];
    [self.navigationController pushViewController:noticeMessageViewController animated:YES];
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
