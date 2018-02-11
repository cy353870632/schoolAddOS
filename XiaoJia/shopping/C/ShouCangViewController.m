//
//  ShouCangViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/20.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShouCangViewController.h"

@interface ShouCangViewController ()
@property(strong,nonatomic)ShouCangView * shoucangView;
@end

@implementation ShouCangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    [self.view addSubview:self.shoucangView];
}
-(ShouCangView *)shoucangView
{
    if (!_shoucangView) {
        _shoucangView = [[ShouCangView alloc]initWithFrame:self.view.bounds];
    }
    return _shoucangView;
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
