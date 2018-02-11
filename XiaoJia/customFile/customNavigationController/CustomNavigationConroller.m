//
//  CustomNavigationConroller.m
//  XiaoJia
//
//  Created by 程远 on 17/4/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomNavigationConroller.h"

@interface CustomNavigationConroller ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;
@end

@implementation CustomNavigationConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}
//跳转时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //隐藏自定义tabbar
        for (UIView *view in self.tabBarController.view.subviews) {
            NSLog(@"%@",view);
            if (view.frame.size.height == 49 || view.frame.size.height == 61 ) {
                view.hidden = YES;
            }
        }
    }
    [super pushViewController:viewController animated:animated];
}


//解决返回手势失效的问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
//设置状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//自定义返回按钮
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage * back_img = [UIImage imageNamed:@"fhan_01"];
    //原图展示
    back_img = [back_img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:back_img style:UIBarButtonItemStyleDone target:self action:@selector(backBarButtonItemAction)];
    
    if (self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
    }
    
    
}

- (void)backBarButtonItemAction
{
    
    [self popViewControllerAnimated:YES];
    if (self.viewControllers.count == 1) {
        //显示自定义tabbar
        for (UIView *view in self.tabBarController.view.subviews) {
            NSLog(@"%@",view);
            if (view.frame.size.height == 49 || view.frame.size.height == 61 ) {
                view.hidden = NO;
            }
        }
    }
    
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
