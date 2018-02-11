//
//  HomeWrokTableViewCell.m
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "LeavingTableViewCell.h"

@implementation LeavingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.homewrok_Img.frame = CGRectMake(15, 8, self.frame.size.width/5.6, self.frame.size.width/5.6);
        [self.contentView addSubview:self.homewrok_Img];
        
        self.homewrok_label.frame = CGRectMake(CGRectGetMaxX(self.homewrok_Img.frame)+15, 20, self.frame.size.width/1.3, 10);
        [self.contentView addSubview:self.homewrok_label];
        self.homewrok_time.frame = CGRectMake(CGRectGetMaxX(self.homewrok_Img.frame)+10, CGRectGetMaxY(self.homewrok_label.frame)+20, self.frame.size.width/1.6, 10);
        [self.contentView addSubview:self.homewrok_time];
        self.leavingTotal_data.frame = CGRectMake(CGRectGetMaxX(self.homewrok_time.frame)+5, CGRectGetMaxY(self.homewrok_label.frame)+5, self.frame.size.width/6, 30);
        [self.contentView addSubview:self.leavingTotal_data];
        self.homewrok_read.frame = CGRectMake(CGRectGetMaxX(self.homewrok_label.frame), 10, 20, 10);
        [self.contentView addSubview:self.homewrok_read];
        
    }
    return self;
}
-(UIImageView *)homewrok_Img
{
    if (!_homewrok_Img) {
        _homewrok_Img = [[UIImageView alloc]init];
        _homewrok_Img.layer.cornerRadius = 7;
        _homewrok_Img.clipsToBounds = YES;
        _homewrok_Img.image = [UIImage imageNamed:@"icon_yuwen"];
    }
    return _homewrok_Img;
}
-(UILabel *)homewrok_label
{
    if (!_homewrok_label) {
        _homewrok_label = [[UILabel alloc]init];
        _homewrok_label.font = [UIFont fontWithName:@"Helvetica" size:13];
        _homewrok_label.text = @"2017.2.12 8:00 --- 2017.2.13 16:00 ";
    }
    return _homewrok_label;
}
-(UILabel *)homewrok_time
{
    if (!_homewrok_time) {
        _homewrok_time = [[UILabel alloc]init];
        _homewrok_time.font = [UIFont fontWithName:@"Helvetica" size:13];
        _homewrok_time.textColor = [UIColor colorWithRed:160.0/255.0 green:160.0/255.0 blue:160.0/255.0 alpha:1];
        _homewrok_time.text = @"孩子做完发烧了，请一天的假";
    }
    return _homewrok_time;
}
-(UILabel *)leavingTotal_data
{
    if (!_leavingTotal_data) {
        _leavingTotal_data = [[UILabel alloc]init];
        _leavingTotal_data.font = [UIFont fontWithName:@"Helvetica" size:20];
        _leavingTotal_data.text = @"1.5天";
    }
    return _leavingTotal_data;
}
-(UILabel *)homewrok_read
{
    if (!_homewrok_read) {
        _homewrok_read = [[UILabel alloc]init];
        _homewrok_read.font = [UIFont fontWithName:@"Helvetica" size:10];
        _homewrok_read.textColor = [UIColor redColor];
        _homewrok_read.text = @"未批";
    }
    return _homewrok_read;
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
