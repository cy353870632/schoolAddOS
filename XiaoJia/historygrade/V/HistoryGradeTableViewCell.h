//
//  HistoryGradeTableViewCell.h
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryGradeTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel * date_label;//日期
@property(strong,nonatomic)UILabel * grade_label;//所在年级
@property(strong,nonatomic)UILabel * classNo_label;//班级排名
@property(strong,nonatomic)UILabel * gradeNo_label;//年级排名
@end
