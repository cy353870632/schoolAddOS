//
//  GradeListCellTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/3/15.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "GradeListCellTableViewCell.h"
@interface GradeListCellTableViewCell()

@end
@implementation GradeListCellTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.subject_lable.frame = CGRectMake(30, 8, 40, 20);
        [self.contentView addSubview:self.subject_lable];
        [self.contentView addSubview:self.grade_lable];
        [self.contentView addSubview:self.ascent_img];
        [self.contentView addSubview:self.regress_img];
        [self.contentView addSubview:self.duibi_lable];
        [self.contentView addSubview:self.average_label];
    }
    return self;
}
-(UILabel *)subject_lable
{
    if (!_subject_lable) {
        _subject_lable = [[UILabel alloc]init];
        _subject_lable.textColor = [UIColor blackColor];
        [_subject_lable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _subject_lable;
}
-(UILabel *)grade_lable
{
    if (!_grade_lable) {
        _grade_lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_subject_lable.frame)+25, 8, 40, 20)];
//        _grade_lable.textColor = Q_gray_color;
        [_grade_lable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _grade_lable;
}
-(UILabel *)ascent_img
{
    if (!_ascent_img) {
        _ascent_img = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_grade_lable.frame)+25, 8, 40, 20)];
        _ascent_img.textColor = [UIColor redColor];
        _ascent_img.text = @"↑";
        [_ascent_img setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _ascent_img;
}
-(UILabel *)regress_img
{
    if (!_regress_img) {
        _regress_img = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_grade_lable.frame)+25, 8, 40, 20)];
        _regress_img.textColor = [UIColor greenColor];
        _regress_img.text = @"↓";
        [_regress_img setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _regress_img;
}
-(UILabel *)duibi_lable
{
    if (!_duibi_lable) {
        _duibi_lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_grade_lable.frame)+50, 8, 30, 20)];
//        _regress_img.textColor = Q_gray_color;
        [_duibi_lable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    }
    return _duibi_lable;
}
-(UILabel *)average_label
{
    if (!_average_label) {
        _average_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_duibi_lable.frame)+30, 8, 110, 20)];
        //        _regress_img.textColor = Q_gray_color;
        [_average_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    }
    return _average_label;
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
