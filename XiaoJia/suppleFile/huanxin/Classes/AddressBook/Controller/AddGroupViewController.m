//
//  AddGroupViewController.m
//  MySchool
//
//  Created by 程远 on 16/10/24.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "AddGroupViewController.h"
#import "AddGroupTableViewCell.h"

@interface AddGroupViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,selectHaoYou>
{
    AddGroupTableViewCell * cell;
}
@property (copy) NSString *(^objectComparisonStringBlock)(id object);
@property (strong, nonatomic) NSMutableArray *contactsSource;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation AddGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建群组";
    self.dataSource = [[NSMutableArray alloc]init];
    
    self.groupName_textfield.frame = CGRectMake(MAINSCREEN.width/10, 71, MAINSCREEN.width/2, 30);
    [self.view addSubview:self.groupName_textfield];
    self.groupMiaoshu_textfield.frame = CGRectMake(MAINSCREEN.width/10, CGRectGetMaxY(self.groupName_textfield.frame)+10, MAINSCREEN.width-MAINSCREEN.width/5, 30);
    [self.view addSubview:self.groupMiaoshu_textfield];
    self.haoyou_label.frame = CGRectMake(10, CGRectGetMaxY(self.groupMiaoshu_textfield.frame)+15, 50,10);
    [self.view addSubview:self.haoyou_label];
    [self loadDataSource];

    //作业按钮
    UIBarButtonItem * homeWork_rightButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick)];
    [homeWork_rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = homeWork_rightButton;
    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(100, MAINSCREEN.height-150, 80, 50);
//    [button setTitle:@"确定" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}
-(void)buttonClick
{
    EMGroupStyleSetting *groupStyleSetting = [[EMGroupStyleSetting alloc] init];
    groupStyleSetting.groupMaxUsersCount = 500; // 创建500人的群，如果不设置，默认是200人。
    groupStyleSetting.groupStyle = eGroupStyle_PublicOpenJoin; // 创建不同类型的群组，这里需要才传入不同的类型
    [[EaseMob sharedInstance].chatManager asyncCreateGroupWithSubject:@"睿通一家人"
                                                          description:@"通一家人通一家人"
                                                             invitees:@[@"chenjia",@"huanghai"]
                                                initialWelcomeMessage:@"邀请您加入群组"
                                                         styleSetting:groupStyleSetting
                                                           completion:^(EMGroup *group, EMError *error) {
                                                               if(!error){
                                                                   NSLog(@"创建成功 -- %@",group);
                                                               }        
                                                           } onQueue:nil];

}
- (void)loadDataSource
{
    
    EMError *error = nil;
    [_dataSource removeAllObjects];
    [_contactsSource removeAllObjects];
    NSArray *buddyList = [[EaseMob sharedInstance].chatManager fetchBuddyListWithError:&error];
    if (!error) {
        NSLog(@"获取成功 -- %@",buddyList);
        _haoyou_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.haoyou_label.frame)+1, MAINSCREEN.width, MAINSCREEN.height) style:UITableViewStylePlain];
        _haoyou_tableview.scrollEnabled = NO;
        _haoyou_tableview.delegate = self;
        _haoyou_tableview.dataSource = self;
        [self.view addSubview:_haoyou_tableview];
    }
    for (NSString *username in buddyList) {
        [self.dataSource addObject:username];
    }
//    [_dataSource addObjectsFromArray:[self sortRecords:self.contactsSource]];
    
        
//        //获取所有好友列表
//        NSArray *buddyList = [[EMClient sharedClient].contactManager getContacts];
//        for (NSString *username in buddyList) {
//            [self.contactsSource addObject:username];
//        }
//        
//        [_dataSource addObjectsFromArray:[self sortRecords:self.contactsSource]];
    
   
}
//完成table方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSource.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[AddGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.deleget = self;
    // Configure the cell...
    if (cell == nil) {
        cell = [[AddGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    EMBuddy * user = _dataSource[indexPath.row];
    NSString *username = user.username;
    cell.select_img.tag = indexPath.row;
//    NSString *username = user[@"username"];
//    NSString *username = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"chatListCellHead.png"];
//    cell.textLabel.text = username;
    cell.userName_label.text = username;
    
    return cell;

    
}
//设置行高
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
////    if (tableView.tag == 2) {
////        return MAINSIZE.height/17;
////    }else{
////        return MAINSIZE.height/17;
////    }
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (tableView.tag == 1) {
//        PlaceMessageViewController * placeMessage = [[PlaceMessageViewController alloc]init];
//        [self.tabBarController.tabBar setHidden:YES];
//        [self.navigationController pushViewController:placeMessage animated:YES];
//        
//    }
//    
    
}

-(UITextField *)groupName_textfield
{
    if (!_groupName_textfield) {
        _groupName_textfield = [[UITextField alloc]init];
        [_groupName_textfield setBorderStyle:UITextBorderStyleRoundedRect]; //设置边框样式
        [_groupName_textfield setKeyboardType:UIKeyboardTypeDefault];
        [_groupName_textfield setClearButtonMode:UITextFieldViewModeWhileEditing];//设置清楚按钮
        _groupName_textfield.placeholder = @"群组名称";
        _groupName_textfield.delegate = self;//指定代理
        [_groupName_textfield becomeFirstResponder];
    }
    return _groupName_textfield;
}
-(UITextField *)groupMiaoshu_textfield
{
    if (!_groupMiaoshu_textfield) {
        _groupMiaoshu_textfield = [[UITextField alloc]init];
        [_groupMiaoshu_textfield setBorderStyle:UITextBorderStyleRoundedRect]; //设置边框样式
        [_groupMiaoshu_textfield setKeyboardType:UIKeyboardTypeDefault];
        [_groupMiaoshu_textfield setClearButtonMode:UITextFieldViewModeWhileEditing];//设置清楚按钮
        _groupMiaoshu_textfield.placeholder = @"群组描述";
        _groupMiaoshu_textfield.delegate = self;//指定代理
    }
    return _groupMiaoshu_textfield;
}
-(UILabel *)haoyou_label
{
    if (!_haoyou_label) {
        _haoyou_label = [[UILabel alloc]init];
        _haoyou_label.text = @"好友列表";
        [_haoyou_label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    }
    return _haoyou_label;
}
/**
 *  选中图片的代理方法
 */
-(void)selectHaoYou:(NSInteger)sender
{
    NSLog(@"选中好友%ld",(long)sender);
}
-(void)quxiaoHaoYou:(NSInteger)sender
{
    NSLog(@"取消好友%ld",(long)sender);
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
