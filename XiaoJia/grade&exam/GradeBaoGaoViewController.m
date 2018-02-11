//
//  GradeBaoGaoViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/3/22.
//  Copyright © 2017年 程远. All rights reserved.
//成绩报告

#import "GradeBaoGaoViewController.h"

@interface GradeBaoGaoViewController ()
@property(strong,nonatomic)GradeBaoGaoView * gradeBaoGaoView;
@end

@implementation GradeBaoGaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.gradeBaoGaoView];
}


-(GradeBaoGaoView *)gradeBaoGaoView
{
    if (!_gradeBaoGaoView) {
        _gradeBaoGaoView = [[GradeBaoGaoView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width, MAINSCREEN.height)];
        
    }
    return _gradeBaoGaoView;
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
