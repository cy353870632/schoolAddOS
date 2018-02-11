//
//  StudentBingDingView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol StudentBingDingViewDelegat <NSObject>

-(void)cityChoose;
-(void)schoolChoose;

@end

@interface StudentBingDingView : CustomView
@property(strong,nonatomic)UILabel * city_label;//城市选择
@property(strong,nonatomic)UILabel * school_label;//学校选择
@property(strong,nonatomic)UITextField * studentName_textField;//学生姓名填写
@property(strong,nonatomic)UITextField * studentNo_textField;//学号填写
@property(strong,nonatomic)UIButton * bingding_button;//城市选择
@property(strong,nonatomic)id<StudentBingDingViewDelegat>deleget;
@end
