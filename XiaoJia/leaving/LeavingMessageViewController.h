//
//  LeavingMessageViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/4/12.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomViewController.h"

@interface LeavingMessageViewController : CustomViewController

@property(strong,nonatomic)UILabel * leavingType_label;//请假类型
@property(strong,nonatomic)UILabel * leavingTime_label;//请假时常
@property(strong,nonatomic)UILabel * leavingDate_label;//请假日期
@property(strong,nonatomic)UILabel * leavingContent_label;//请假备注
@property(strong,nonatomic)UILabel * teacherReader_label;//教师已阅
@property(strong,nonatomic)UILabel * teacherHuiFu_label;//教师回复
@end
