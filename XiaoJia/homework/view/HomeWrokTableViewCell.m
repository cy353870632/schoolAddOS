//
//  HomeWrokTableViewCell.m
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "HomeWrokTableViewCell.h"

@implementation HomeWrokTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.homewrok_Img.frame = CGRectMake(15, 8, self.frame.size.width/5.6, self.frame.size.width/5.6);
        [self.contentView addSubview:self.homewrok_Img];
        
        self.homewrok_label.frame = CGRectMake(CGRectGetMaxX(self.homewrok_Img.frame)+15, 20, self.frame.size.width/1.3, 10);
        [self.contentView addSubview:self.homewrok_label];
        self.homewrok_time.frame = CGRectMake(CGRectGetMaxX(self.homewrok_Img.frame)+10, CGRectGetMaxY(self.homewrok_label.frame)+20, self.frame.size.width/2, 10);
        [self.contentView addSubview:self.homewrok_time];
        self.homewrok_read.frame = CGRectMake(CGRectGetMaxX(self.homewrok_label.frame), 10, 20, 10);
        [self.contentView addSubview:self.homewrok_read];
        
        self.noticeType_label.frame = CGRectMake(CGRectGetMaxX(self.homewrok_time.frame)+15, CGRectGetMaxY(self.homewrok_label.frame)+20, MAINSCREEN.width/3, 10);
        [self.contentView addSubview:self.noticeType_label];
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
        _homewrok_label.font = [UIFont fontWithName:@"Helvetica" size:15];
        _homewrok_label.text = @"语文";
    }
    return _homewrok_label;
}
-(UILabel *)homewrok_time
{
    if (!_homewrok_time) {
        _homewrok_time = [[UILabel alloc]init];
        _homewrok_time.font = [UIFont fontWithName:@"Helvetica" size:13];
        _homewrok_time.textColor = [UIColor colorWithRed:160.0/255.0 green:160.0/255.0 blue:160.0/255.0 alpha:1];
        _homewrok_time.text = @"2016-10-24  17:13:20";
    }
    return _homewrok_time;
}
-(UILabel *)homewrok_read
{
    if (!_homewrok_read) {
        _homewrok_read = [[UILabel alloc]init];
        _homewrok_read.font = [UIFont fontWithName:@"Helvetica" size:10];
        _homewrok_read.textColor = [UIColor redColor];
        _homewrok_read.text = @"未读";
    }
    return _homewrok_read;
}
-(UILabel *)noticeType_label
{
    if (!_noticeType_label) {
        _noticeType_label = [[UILabel alloc]init];
        _noticeType_label.font = [UIFont fontWithName:@"Helvetica" size:11];
        _noticeType_label.textColor = [UIColor grayColor];
        _noticeType_label.text = @"类型：公告通知";
    }
    return _noticeType_label;
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
