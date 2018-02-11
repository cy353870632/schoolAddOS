//
//  UBAcceptedBuddyViewController.m
//  UChat
//
//  Created by xsj on 16/1/19.
//  Copyright © 2016年 xusj. All rights reserved.
//

#import "UBAcceptedBuddyViewController.h"
#import "UBAcceptedBuddyViewCell.h"
#import "UBInvitationManagerTool.h"
#import "UBMessageMacro.h"
#import <EaseMob.h>

@interface UBAcceptedBuddyViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableViewData;

@end

@implementation UBAcceptedBuddyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    self.title = @"验证消息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadInvitationData];
}
- (void)loadInvitationData {
    UBInvitationManagerTool *invitationMrg = [UBInvitationManagerTool sharedInstance];
    self.tableViewData =  [[invitationMrg applyEmtitiesWithloginUser:kMessageUsername] mutableCopy];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UBAcceptedBuddyViewCell *cell = [UBAcceptedBuddyViewCell cellWithTableView:tableView];
    cell.acceptButton.tag = indexPath.row;
    cell.cancelButton.tag = indexPath.row;
    [cell.acceptButton addTarget:self action:@selector(acceptButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)acceptButtonClick:(UIButton *)sender
{
    ApplyEntity * apply = self.tableViewData[sender.tag];
    NSLog(@"%@", apply.applicantUsername);
    NSLog(@"发送同意成功");
    EMError *error = nil;
    BOOL isSuccess = [[EaseMob sharedInstance].chatManager acceptBuddyRequest:apply.applicantUsername error:&error];
    if (isSuccess) {
        [[UBInvitationManagerTool sharedInstance] removeInvitation:apply loginUser:kMessageUsername];
        self.tableViewData =  [[[UBInvitationManagerTool sharedInstance]  applyEmtitiesWithloginUser:kMessageUsername] mutableCopy];
        [self.tableView reloadData];
        //    NSString *badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)[[UBInvitationManagerTool sharedInstance] applyEmtitiesWithloginUser:kMessageUsername].count];
        if (self.tableViewData.count == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else
    {
        [self.view makeToast:@"添加失败,请稍后重试" duration:1.5 position:@"center"];//在中间显示土司
    }
}
-(void)cancelButtonClick:(UIButton *)sender
{
    [self.tableViewData removeObjectAtIndex:sender.tag];
    [self.tableView reloadData];
    if (self.tableViewData.count == 0) {
         [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ApplyEntity * apply = self.tableViewData[indexPath.row];
//    NSLog(@"%@", apply.applicantUsername);
//    
//    EMError *error = nil;
//    BOOL isSuccess = [[EaseMob sharedInstance].chatManager acceptBuddyRequest:apply.applicantUsername error:&error];
//    if (isSuccess && !error) {
//        NSLog(@"发送同意成功");
//        [[UBInvitationManagerTool sharedInstance] removeInvitation:apply loginUser:kMessageUsername];
//        self.tableViewData =  [[[UBInvitationManagerTool sharedInstance]  applyEmtitiesWithloginUser:kMessageUsername] mutableCopy];
//        [self.tableView reloadData];
//        NSString *badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)[[UBInvitationManagerTool sharedInstance] applyEmtitiesWithloginUser:kMessageUsername].count];
//        //通讯录新消息，tabbar的提醒
////        self.navigationController.tabBarItem.badgeValue = badgeValue;
//    }else
//    {
//        NSLog(@"拒绝了！！！");
//    }

}

#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame  = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor colorWithRed:0.8941 green:0.9059 blue:0.9255 alpha:1.0];
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)tableViewData {
    if (!_tableViewData) {
        _tableViewData = [NSMutableArray array];
    }
    return _tableViewData;
}

@end
