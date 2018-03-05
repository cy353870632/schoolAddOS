//
//  CustomViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取当前控制器名称
    NSLog(@"当前控制器    %@",NSStringFromClass([self class]));
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)hiddenTabbarController{
    //隐藏自定义tabbar
    for (UIView *view in self.tabBarController.view.subviews) {
        NSLog(@"%@",view);
        if (view.frame.size.height == 49 || view.frame.size.height == 61 ) {
            view.hidden = YES;
        }
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
-(void)showTabbarController{
    //显示自定义tabbar
    for (UIView *view in self.tabBarController.view.subviews) {
        NSLog(@"%@",view);
        if (view.frame.size.height == 49 || view.frame.size.height == 61 ) {
            view.hidden = NO;
        }
    }
}
//点击空白，取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
//注销通知
- (void) dealloc {
    
    [MSNotificationCenter removeObserver:self];
    
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
