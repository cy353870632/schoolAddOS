//
//  HistoryGradeTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HistoryGradeTableViewCell.h"
@interface HistoryGradeTableViewCell()

@end
@implementation HistoryGradeTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * riqi_label = [[UILabel alloc]initWithFrame:CGRectMake(20, MAINSCREEN.width/20, MAINSCREEN.width/4, 15)];
        [riqi_label setText:@"考试日期："];
        [riqi_label setTextColor:[UIColor grayColor]];
        [riqi_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [self.contentView addSubview:riqi_label];
        
        [self.date_label setFrame:CGRectMake(CGRectGetMaxX(riqi_label.frame)-10, MAINSCREEN.width/20, MAINSCREEN.width/4, 15)];
        [self.contentView addSubview:self.date_label];
        
        UILabel * nianji_label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(riqi_label.frame)+20, MAINSCREEN.width/4, 15)];
        [nianji_label setText:@"年级班级："];
        [nianji_label setTextColor:[UIColor grayColor]];
        [nianji_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [self.contentView addSubview:nianji_label];
        
        [self.grade_label setFrame:CGRectMake(CGRectGetMaxX(nianji_label.frame)-10, CGRectGetMaxY(self.date_label.frame)+20, MAINSCREEN.width/4, 15)];
        [self.contentView addSubview:self.grade_label];
        
        UIImageView * nianji_img = [[UIImageView alloc]initWithFrame:CGRectMake(MAINSCREEN.width-MAINSCREEN.width/4.7,MAINSCREEN.width/35, MAINSCREEN.width/6,  MAINSCREEN.width/6)];
        [nianji_img setImage:[UIImage imageNamed:@"nianjiNo"]];
        [nianji_img setAlpha:0.8];
        [self.contentView addSubview:nianji_img];
        
        [self.gradeNo_label setFrame:CGRectMake(CGRectGetMinX(nianji_img.frame)+10, CGRectGetMinY(nianji_img.frame)+10, MAINSCREEN.width/9, MAINSCREEN.width/9)];
        [self.contentView addSubview:self.gradeNo_label];
        
        UIImageView * banji_img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(nianji_img.frame)-MAINSCREEN.width/5,MAINSCREEN.width/35, MAINSCREEN.width/6,  MAINSCREEN.width/6)];
        [banji_img setImage:[UIImage imageNamed:@"classPaiMing"]];
        [banji_img setAlpha:0.8];
        [self.contentView addSubview:banji_img];
        
        [self.classNo_label setFrame:CGRectMake(CGRectGetMinX(banji_img.frame)+10, CGRectGetMinY(banji_img.frame)+10, MAINSCREEN.width/9, MAINSCREEN.width/9)];
        [self.contentView addSubview:self.classNo_label];
        
    }
    return self;
}
-(UILabel *)date_label{
    if (!_date_label) {
        _date_label = [[UILabel alloc]init];
        [_date_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        
    }
    return _date_label;
}
-(UILabel *)grade_label{
    if (!_grade_label) {
        _grade_label = [[UILabel alloc]init];
        [_grade_label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        
    }
    return _grade_label;
}
-(UILabel *)classNo_label{
    if (!_classNo_label) {
        _classNo_label = [[UILabel alloc]init];
        _classNo_label.textAlignment = NSTextAlignmentCenter;
        [_classNo_label setTextColor:[UIColor whiteColor]];
        [_classNo_label setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        
    }
    return _classNo_label;
}
-(UILabel *)gradeNo_label{
    if (!_gradeNo_label) {
        _gradeNo_label = [[UILabel alloc]init];
        _gradeNo_label.textAlignment = NSTextAlignmentCenter;
        [_gradeNo_label setTextColor:[UIColor whiteColor]];
        [_gradeNo_label setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        
    }
    return _gradeNo_label;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
