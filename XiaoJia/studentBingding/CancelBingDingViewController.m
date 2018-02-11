//
//  CancelBingDingViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CancelBingDingViewController.h"

@interface CancelBingDingViewController ()
@property(strong,nonatomic)CancelBingDIngView * cancelBingDIngView;
@end

@implementation CancelBingDingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.cancelBingDIngView];
    
}
-(CancelBingDIngView *)cancelBingDIngView
{
    if (!_cancelBingDIngView) {
        _cancelBingDIngView = [[CancelBingDIngView alloc]initWithFrame:self.view.bounds];
        [_cancelBingDIngView.back_button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBingDIngView;
}

-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
