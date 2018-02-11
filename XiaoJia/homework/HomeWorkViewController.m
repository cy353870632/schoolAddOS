//
//  HomeWorkViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/2/27.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HomeWorkViewController.h"

@interface HomeWorkViewController ()<selectCellDeleget>
@property(strong,nonatomic)HomeWorkView * homeWorkView;
@end

@implementation HomeWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"作业";
    [self.view addSubview:self.homeWorkView];
}


/*
 *加载控件
 */
-(HomeWorkView *)homeWorkView
{
    if (!_homeWorkView) {
        _homeWorkView = [[HomeWorkView alloc]initWithFrame:self.view.bounds];
        _homeWorkView.deleget = self;
    }
    return _homeWorkView;
}

/*
 *点击cell跳转
 */
-(void)didSelectCell:(NSString *)title
{
    HomeWorkMessageViewController * homeWorkMessageViewController = [[HomeWorkMessageViewController alloc]init];
    homeWorkMessageViewController.title = title;
    [self.navigationController pushViewController:homeWorkMessageViewController animated:YES];
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
