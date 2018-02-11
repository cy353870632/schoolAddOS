//
//  TeacherSuggestViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/5/8.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "TeacherSuggestViewController.h"

@interface TeacherSuggestViewController ()
@property(strong,nonatomic)NSMutableArray * shopping_array;
@end

@implementation TeacherSuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"教师推荐";
    self.shopping_array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 15; i++) {
        NSDictionary * dic = @{@"title":[NSString stringWithFormat:@"%d条培训计划",i]
                               ,@"description":@"三里屯培训学校"
                               ,@"price":[NSString stringWithFormat:@"%d00 元",i+1]
                               ,@"time":@"40课时"
                               ,@"joinAndComment":@"100人报名    65人已评论"
                               ,@"oneClassTime":@"／课时"
                               ,@"unitPrice":[NSString stringWithFormat:@"%d0",i+1]
                               };
        [self.shopping_array addObject:dic];
    }
    
    TeacherSuggestView * teacherSuggestView = [[TeacherSuggestView alloc]initWithFrame:CGRectMake(0, MAINSCREEN.height/11, MAINSCREEN.width, MAINSCREEN.height-MAINSCREEN.height/11)];
    teacherSuggestView.shopping_array = self.shopping_array;
    [self.view addSubview:teacherSuggestView];
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
