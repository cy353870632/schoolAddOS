//
//  SingleGradeViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/3/21.
//  Copyright © 2017年 程远. All rights reserved.
//点击扇形进入该单科点评页面

#import "CustomViewController.h"

@interface SingleGradeViewController : CustomViewController
@property(strong,nonatomic)NSMutableArray * grade_array;
@property(strong,nonatomic)UILabel * grade_label;
@property(strong,nonatomic)UILabel * advanceimg_label;
@property(strong,nonatomic)UILabel * teacherName_label;
@property(strong,nonatomic)UILabel * className_label;
@property(strong,nonatomic)UILabel * pingyu_label;
@property(strong,nonatomic)UIImageView * kaoshang_img;
@property(strong,nonatomic)UILabel * notice_label;
@end
