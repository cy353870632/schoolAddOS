//
//  NewsNoticeViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "NewsNoticeViewController.h"

@interface NewsNoticeViewController ()
@property(strong,nonatomic)NewsView * newsView;
@end

@implementation NewsNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学校动态";
    self.navigationItem.leftBarButtonItem = nil;
    [self.view addSubview:self.newsView];
    
    //通知按钮
    UIBarButtonItem * notice_rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_notice"] style:UIBarButtonItemStyleDone target:self action:@selector(schoolNotice)];
    [notice_rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = notice_rightButton;
}

-(void)schoolNotice
{
    NSLog(@"点击了 资讯首页 通知按钮");
    NoticeViewController * noticeViewController = [[NoticeViewController alloc]init];
    [self.navigationController pushViewController:noticeViewController animated:YES];
}

-(NewsView * )newsView
{
    if (!_newsView) {
        _newsView = [[NewsView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11+3, MAINSCREEN.width, MAINSCREEN.height-MAINSCREEN.height/7)];
        
    }
    return _newsView;
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
