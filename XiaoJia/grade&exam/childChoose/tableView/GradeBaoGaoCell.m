//
//  GradeBaoGaoCell.m
//  XiaoJia
//
//  Created by 程远 on 17/4/11.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GradeBaoGaoCell.h"

@implementation GradeBaoGaoCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self.contentView addSubview:self.subject_lable];
        [self.contentView addSubview:self.subjectPJF_lable];
        [self.contentView addSubview:self.classPJF_lable];
        [self.contentView addSubview:self.classNo_label];
        [self.contentView addSubview:self.gradePJF_label];
        [self.contentView addSubview:self.gradeNo_label];

    }
    return self;
}
-(UILabel *)subject_lable
{
    if (!_subject_lable) {
        _subject_lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 3, MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_subject_lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_subject_lable setTextAlignment:NSTextAlignmentCenter];
    }
    return _subject_lable;
}
-(UILabel *)subjectPJF_lable
{
    if (!_subjectPJF_lable) {
        _subjectPJF_lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_subject_lable.frame), 3,MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_subjectPJF_lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_subjectPJF_lable setTextAlignment:NSTextAlignmentCenter];
    }
    return _subjectPJF_lable;
}
-(UILabel *)classPJF_lable
{
    if (!_classPJF_lable) {
        _classPJF_lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_subjectPJF_lable.frame), 3,MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_classPJF_lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_classPJF_lable setTextAlignment:NSTextAlignmentCenter];
    }
    return _classPJF_lable;
}
-(UILabel *)classNo_label
{
    if (!_classNo_label) {
        _classNo_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_classPJF_lable.frame), 3,MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_classNo_label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_classNo_label setTextAlignment:NSTextAlignmentCenter];
    }
    return _classNo_label;
}
-(UILabel *)gradePJF_label
{
    if (!_gradePJF_label) {
        _gradePJF_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_classNo_label.frame), 3,MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_gradePJF_label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_gradePJF_label setTextAlignment:NSTextAlignmentCenter];
    }
    return _gradePJF_label;
}
-(UILabel *)gradeNo_label
{
    if (!_gradeNo_label) {
        _gradeNo_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_gradePJF_label.frame), 3,MAINSCREEN.width/6, 20)];
        //        _grade_lable.textColor = Q_gray_color;
        [_gradeNo_label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [_gradeNo_label setTextAlignment:NSTextAlignmentCenter];
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
