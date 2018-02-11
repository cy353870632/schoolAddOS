//
//  PersonView.m
//  MySchool
//
//  Created by 程远 on 16/10/18.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "PersonView.h"

@interface PersonView()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    PersonTableViewCell * cell;
}
@end

@implementation PersonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.8;
        
        self.person_img.frame = CGRectMake((MAINSCREEN.width-50)/2-80, MAINSCREEN.height/9+30,80, 80);
        self.person_img.layer.cornerRadius = 40;
        self.person_img.clipsToBounds = YES;
        self.person_img.userInteractionEnabled = YES;
        [self addSubview:self.person_img];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectPhoto)];
        [self.person_img addGestureRecognizer:tap];
        
        self.personNmae_label.frame = CGRectMake(CGRectGetMinX(self.person_img.frame), CGRectGetMaxY(self.person_img.frame)+15, self.person_img.frame.size.width, 20);
        [self addSubview:self.personNmae_label];
        self.personImg_array = [[NSArray alloc]init];
        self.personImg_array = @[@"icon_parentsBar",@"icon_search",@"icon_play",@"TabBar5",@"icon_play"];
        self.personLabel_array = [[NSArray alloc]init];
        self.personLabel_array = @[@"基本资料",@"请假",@"我的订单",@"关系绑定",@"设置"];
        [self addSubview:self.person_tableview];
        
        self.getOut_btn.frame = CGRectMake(CGRectGetMinX(self.person_img.frame)-30, CGRectGetMaxY(self.person_tableview.frame)+35, self.person_img.frame.size.width+70, 40);
        [self addSubview:self.getOut_btn];
    }
    return self;
}

-(UIImageView *)person_img
{
    if (!_person_img) {
        _person_img = [[UIImageView alloc]init];
        _person_img.image = [UIImage imageNamed:@"haizeiwang2"];
    }
    return _person_img;
}
-(UILabel *)personNmae_label
{
    if (!_personNmae_label) {
        _personNmae_label = [[UILabel alloc]init];
        _personNmae_label.text = @"程远";
        _personNmae_label.textAlignment = UITextAlignmentCenter;
        _personNmae_label.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeNikeName)];
        [_personNmae_label addGestureRecognizer:tap]	;
    }
    return _personNmae_label;
}
-(UITableView *)person_tableview{
    if (!_person_tableview) {
        _person_tableview = [[UITableView alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.personNmae_label.frame)+20, MAINSCREEN.width-120, MAINSCREEN.height/2.4) style:UITableViewStyleGrouped];
        _person_tableview.dataSource = self;
        _person_tableview.delegate = self;
        [_person_tableview setSectionFooterHeight:0];
        _person_tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _person_tableview.scrollEnabled = NO;
        _person_tableview.backgroundColor = [UIColor whiteColor];
    }
    return _person_tableview;
}
-(UIButton *)getOut_btn
{
    if (!_getOut_btn) {
        _getOut_btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        [_getOut_btn addTarget:self action:@selector(getOutClick) forControlEvents:UIControlEventTouchUpInside];
        _getOut_btn.backgroundColor = [UIColor colorWithRed:0.231 green:0.678 blue:0.050 alpha:1.000];
        _getOut_btn.layer.cornerRadius = 7;
        _getOut_btn.layer.borderColor = [UIColor colorWithWhite:0.321 alpha:1.000].CGColor;
        _getOut_btn.layer.borderWidth = 1;
        [_getOut_btn setTitle:@"退出登录" forState:UIControlStateNormal];
        _getOut_btn.tintColor = [UIColor whiteColor];
        [_getOut_btn addTarget:self action:@selector(loginOutBtnDid) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getOut_btn;
}
/**
*事件
*/
#pragma mark - event response
//退出登录，消除所有缓存和通知
- (void)loginOutBtnDid {
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:nil message:@"确认退出当前帐号" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertview show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    NSString *msg = [[NSString alloc] initWithFormat:@"您点击的是第%ld个按钮!",(long)buttonIndex];
    NSLog(@"msg:%@",msg);
    if (buttonIndex == 0) {
        return;
    }else if(buttonIndex == 1){
        NSLog(@"确认退出登录");
        [self.delegat loginOut];
        return;
    }
}
#pragma mark - privete method
- (void)loginOutAction {    
    
}
//修改昵称
-(void)changeNikeName
{
    [self.delegat changeNikeName];
}
//指定每一个section的头部高度
-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
//指定有多少个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//指定每个section里面有多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//指定内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.title_img.image = [UIImage imageNamed:_personImg_array[indexPath.section]];
    cell.title_label.text = _personLabel_array[indexPath.section];
    return cell;
    
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

//点击每个分区执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegat didselectCell:indexPath.section];
}
//选择头像
-(void)selectPhoto{
    [self.delegat selectPhoto];
}

@end
