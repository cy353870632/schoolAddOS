//
//  BasicsMessageStudentBangdingView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/12.
//  Copyright © 2017年 程远. All rights reserved.
// 基本资料－－－绑定情况view


#import "CustomView.h"

@protocol studentBangDingDelegat <NSObject>

-(void)cancelBangDing:(NSInteger)index;

@end

@interface BasicsMessageStudentBangdingView : CustomView
@property(strong,nonatomic)UILabel * studentName_label; //学生姓名
@property(strong,nonatomic)UILabel * studentSchool_label; //学生学校
@property(strong,nonatomic)UILabel * studentNo_label; //学生学号 （只显示后4位）//解除的时候，要验证学号
@property(strong,nonatomic)UILabel * studentClass_label; //学生班级
@property(strong,nonatomic)UIButton * cancelBangDing_button; //取消绑定
@property(strong,nonatomic)id<studentBangDingDelegat>delegat;
@end
