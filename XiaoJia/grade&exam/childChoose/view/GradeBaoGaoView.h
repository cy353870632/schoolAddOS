//
//  GradeBaoGaoView.h
//  XiaoJia
//
//  Created by 程远 on 17/3/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@interface GradeBaoGaoView : CustomView
@property (nonatomic, strong)NSArray *colors;//每一个扇形的颜色
@property (nonatomic, strong)NSArray *labelBackgroundColor;
@property (nonatomic, strong)NSArray *subject_array;//总共成绩科目
@property (nonatomic, strong)NSArray *grade_array;//每科成绩
@property (nonatomic, strong)NSArray *advance_array;//每科成绩提高腿部分数
@property (nonatomic, strong)NSArray *advanceImg_array;//进步退步标记 0退步1进步
@property (nonatomic, strong)NSMutableArray *shopping_array;
@property (nonatomic, strong)UIButton *gradeBaoGao_button;
@property (nonatomic, strong)UIButton *liShiShuJu_button;
@property (nonatomic, strong)UITableView * GradeList_tableView;
@property (nonatomic, strong)UITableView * tigao_tableView;//需要提高的tableview
@property (nonatomic, strong)UITableView * baochi_tableView;//优势科目
@property (nonatomic, strong)UILabel * notice_label;//提示label
@property (nonatomic, strong)UILabel * notice2_label;//提示label
@end
