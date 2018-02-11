//
//  StudentBingdingViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "StudentBingdingViewController.h"

@interface StudentBingdingViewController ()<StudentBingDingViewDelegat,SchoolChooseViewDeleget>
@property(strong,nonatomic)StudentBingDingView * studentBingDingView;
@property(strong,nonatomic)SchoolChooseView * schoolChooseView;
@end

@implementation StudentBingdingViewController
//因为要回调，所以要重写back按钮
-(void)viewDidAppear:(BOOL)animated
{
    UIImage * back_img = [UIImage imageNamed:@"fhan_01"];
    //原图展示
    back_img = [back_img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:back_img style:UIBarButtonItemStyleDone target:self action:@selector(GoBackController)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}
-(void)GoBackController
{
    
    [self.navigationController popViewControllerAnimated:YES];
    [self showTabbarController];
    [self.delegat studentbingdingShowPersonCenter];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关系绑定";
    [self.view addSubview:self.studentBingDingView];
}
-(StudentBingDingView *)studentBingDingView
{
    if (!_studentBingDingView) {
        _studentBingDingView = [[StudentBingDingView alloc]initWithFrame:self.view.bounds];
        _studentBingDingView.deleget = self;
    }
    return _studentBingDingView;
}-(SchoolChooseView *)schoolChooseView
{
    if (!_schoolChooseView) {
        _schoolChooseView = [[SchoolChooseView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/10, MAINSCREEN.width, MAINSCREEN.height)];
        _schoolChooseView.delegat = self;
        
    }
    return _schoolChooseView;
}
//代理方法
-(void)cityChoose
{
    CityViewController *controller = [[CityViewController alloc] init];
    //定位城市
    controller.currentCityString = @"杭州";
    controller.selectString = ^(NSString *string){
        _studentBingDingView.city_label.text = string;
        _studentBingDingView.city_label.textColor = [UIColor blackColor];
    };
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)schoolChoose
{
    [self.view addSubview:self.schoolChooseView];
}
//选择学校名称
-(void)schoolNameChoose:(NSInteger)index
{
    NSLog(@"选择了学校");
    self.studentBingDingView.school_label.text = @"五缘第二实验中学";
    self.studentBingDingView.school_label.textColor = [UIColor blackColor];
    [self.schoolChooseView removeFromSuperview];
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
