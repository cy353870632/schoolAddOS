//
//  GradeListCellTableViewCell.h
//  XiaoJia
//
//  Created by 程远 on 17/3/15.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradeListCellTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel * subject_lable;
@property(strong,nonatomic)UILabel * grade_lable;
@property(strong,nonatomic)UILabel * duibi_lable;//比上次考试分数上升，下降了多少
@property(strong,nonatomic)UILabel * ascent_img;//进步img
@property(strong,nonatomic)UILabel * regress_img;//进步img
@property(strong,nonatomic)UILabel * average_label;//班级平均分
@end
