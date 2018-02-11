//
//  GradeBaoGaoCell.h
//  XiaoJia
//
//  Created by 程远 on 17/4/11.
//  Copyright © 2017年 程远. All rights reserved.
//PJF:平均分

#import <UIKit/UIKit.h>

@interface GradeBaoGaoCell : UITableViewCell
@property(strong,nonatomic)UILabel * subject_lable;//科目
@property(strong,nonatomic)UILabel * subjectPJF_lable;//三个月该科平均分
@property(strong,nonatomic)UILabel * classPJF_lable;//三个月该科班机的平均分
@property(strong,nonatomic)UILabel * classNo_label;//班机平均名次
@property(strong,nonatomic)UILabel * gradePJF_label;//年级平均分
@property(strong,nonatomic)UILabel * gradeNo_label;//年级平均分
@end
