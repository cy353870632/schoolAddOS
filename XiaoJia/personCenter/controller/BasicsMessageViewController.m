//
//  BasicsMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "BasicsMessageViewController.h"

@interface BasicsMessageViewController ()<cancelDelegat>
@property(strong,nonatomic)BasicsMessageView * basicsMessageView;
@end

@implementation BasicsMessageViewController

//因为要回调，所以要重写back按钮
-(void)viewDidAppear:(BOOL)animated
{
    UIImage * back_img = [UIImage imageNamed:@"fhan_01"];
    //原图展示
    back_img = [back_img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:back_img style:UIBarButtonItemStyleDone target:self action:@selector(GoBackController)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本资料";
//    [self.navigationItem.leftBarButtonItem setAction:@selector(GoBack)];

    
    [self.view addSubview:self.basicsMessageView];
}

-(void)GoBackController
{
    
    [self.navigationController popViewControllerAnimated:YES];
    [self showTabbarController];
    [self.deleget showPersonCenter];
}


-(BasicsMessageView *)basicsMessageView
{
    if (!_basicsMessageView) {
        _basicsMessageView = [[BasicsMessageView alloc]initWithFrame:self.view.bounds withStudentNo:4];
        _basicsMessageView.delegat = self;
    }
    return _basicsMessageView;
}
-(void)cancelBingDing:(NSInteger)index
{
    NSLog(@"解除绑定controller 解除学生验证跳转");
    CancelBingDingViewController * cancelBingDingViewController = [[CancelBingDingViewController alloc]init];
    [self presentViewController:cancelBingDingViewController animated:YES completion:nil];
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
