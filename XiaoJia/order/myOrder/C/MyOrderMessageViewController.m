//
//  MyOrderMessageViewController.m
//  XiaoJia
//
//  Created by 程远 on 17/4/20.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "MyOrderMessageViewController.h"

@interface MyOrderMessageViewController ()
{
    UIImageView * photo_img;
    UILabel * title_label;
    UILabel * peixunjigou_label;
    UILabel * address_label;
    UILabel * yuanjia_label;
    UIImageView * yuanjia_img;
    UILabel * keshi_label;
    UILabel * youhui_label;
    UILabel * zhifu_label;
    UILabel * kechengDate_label;
    UILabel * dingdanDate_label;
    UIButton * pingjia_button;
    
}
@end

@implementation MyOrderMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    
    photo_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width/18-5, MAINSCREEN.height/7, MAINSCREEN.width/2.5, MAINSCREEN.width/2.5+30)];
    photo_img.layer.cornerRadius = 7;
    photo_img.clipsToBounds = YES;
    [photo_img setImage:[UIImage imageNamed:@"icon_other"]];
    [self.view addSubview:photo_img];
    
    title_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photo_img.frame)+10, CGRectGetMinY(photo_img.frame)+10, MAINSCREEN.width/2, 30)];
    title_label.text = @"数学高三培训班";
    [title_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:title_label];
    
    peixunjigou_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photo_img.frame)+10, CGRectGetMinY(title_label.frame)+40, MAINSCREEN.width/2, 30)];
    peixunjigou_label.text = @"新东方培训学校(厦门)";
    [peixunjigou_label setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [self.view addSubview:peixunjigou_label];
    
    address_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photo_img.frame)+10, CGRectGetMinY(peixunjigou_label.frame)+40, MAINSCREEN.width/2.3, 50)];
    address_label.text = @"厦门市集美区后溪镇软件园三期a座01号";
    address_label.numberOfLines = 0;
    address_label.lineBreakMode = NSLineBreakByCharWrapping;
    [address_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [self.view addSubview:address_label];
    
    keshi_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photo_img.frame)+10, CGRectGetMinY(address_label.frame)+50, MAINSCREEN.width/2, 30)];
    keshi_label.text = @"30课时";
    [keshi_label setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [self.view addSubview:keshi_label];
    
    NSString * string = @"优惠信息：平台在线报名，优惠5折优惠信息：平台在线报名，优惠5折优惠信息：平台在线报名，优惠5折优惠信息：平台在线报名，优惠5折";
    youhui_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(photo_img.frame), CGRectGetMaxY(photo_img.frame)+40, MAINSCREEN.width/2, 20*string.length/12)];
    youhui_label.text = string;
    youhui_label.numberOfLines = 0;
    youhui_label.lineBreakMode = NSLineBreakByCharWrapping;
    [youhui_label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [self.view addSubview:youhui_label];
    
    yuanjia_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(youhui_label.frame)+10, CGRectGetMaxY(photo_img.frame)+7*string.length/12, MAINSCREEN.width/2.5, 30)];
    yuanjia_label.text = @"200";
    yuanjia_label.textColor = [UIColor grayColor];
    yuanjia_label.textAlignment = UITextAlignmentCenter;
    [yuanjia_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:yuanjia_label];
    
    yuanjia_img= [[UIImageView alloc]initWithFrame:CGRectMake(yuanjia_label.frame.size.width/6, yuanjia_label.frame.size.height/2, yuanjia_label.frame.size.width-yuanjia_label.frame.size.width/3,1)];
    yuanjia_img.layer.cornerRadius = 7;
    yuanjia_img.clipsToBounds = YES;
    yuanjia_img.backgroundColor = [UIColor grayColor];
    [yuanjia_label addSubview:yuanjia_img];
    
    zhifu_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(youhui_label.frame)+10, CGRectGetMaxY(yuanjia_label.frame)+20, MAINSCREEN.width/2.5, 30)];
    zhifu_label.text = @"100";
    zhifu_label.textColor = red_color;
    zhifu_label.textAlignment = UITextAlignmentCenter;
    [zhifu_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    [self.view addSubview:zhifu_label];
    
    
    kechengDate_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(photo_img.frame), CGRectGetMaxY(youhui_label.frame)+25, MAINSCREEN.width, 30)];
    kechengDate_label.text = @"课程日期：2017-3-25  至  2017-4-25";
    [kechengDate_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:kechengDate_label];
    
    dingdanDate_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(photo_img.frame), CGRectGetMaxY(kechengDate_label.frame)+15, MAINSCREEN.width, 30)];
    dingdanDate_label.text = @"订单日期：2017-3-10";
    [dingdanDate_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:dingdanDate_label];
    
    pingjia_button = [UIButton buttonWithType:UIButtonTypeSystem];
    pingjia_button.frame = CGRectMake(MAINSCREEN.width/6, CGRectGetMaxY(dingdanDate_label.frame)+30, MAINSCREEN.width-MAINSCREEN.width/3, 70);
    [pingjia_button setTitle:@"前  去  评  价" forState:UIControlStateNormal];
    pingjia_button.layer.cornerRadius = 7;
    pingjia_button.backgroundColor = blue_color;
    pingjia_button.tintColor = [UIColor whiteColor];
    [self.view addSubview:pingjia_button];
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
