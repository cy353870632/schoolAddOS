//
//  ShoppingTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/3/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShoppingTableViewCell.h"

@implementation ShoppingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.photo_img];
        [self.contentView addSubview:self.title_label];
        [self.contentView addSubview:self.description_label];
        [self.contentView addSubview:self.price_label];
        [self.contentView addSubview:self.time_label];
        [self.contentView addSubview:self.joinAndComment_label];
        
        [self.contentView addSubview:self.unitPrice_label];
        [self.contentView addSubview:self.oneClassTime_label];
        [self.contentView addSubview:self.shoucang_button];
        
        UIImageView * fenge_img = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(self.joinAndComment_label.frame)-5, MAINSCREEN.width, 0.5)];
        [fenge_img setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:fenge_img];
    }
    return self;
}



-(UIImageView *)photo_img
{
    if(!_photo_img){
        _photo_img = [[UIImageView alloc]initWithFrame:CGRectMake(25, 10, MAINSCREEN.width/4-25, MAINSCREEN.width/4)];
        _photo_img.layer.cornerRadius = 7;
        _photo_img.clipsToBounds = YES;
        [_photo_img setImage:[UIImage imageNamed:@"icon_other"]];
    }
    return _photo_img;
}
-(UILabel *)title_label
{
    if (!_title_label) {
        _title_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+20, 15, MAINSCREEN.width/2.5, 20)];
         [_title_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
        
    }
    return _title_label;
}
-(UILabel *)description_label
{
    if (!_description_label) {
        _description_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+20, CGRectGetMaxY(_title_label.frame)+10, MAINSCREEN.width/2.5, 20)];
        [_description_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
        
    }
    return _description_label;
}
-(UILabel *)price_label
{
    if (!_price_label) {
        _price_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+20, CGRectGetMaxY(_description_label.frame)+10, MAINSCREEN.width/5, 20)];
        [_price_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
        
    }
    return _price_label;
}
-(UILabel *)time_label
{
    if (!_time_label) {
        _time_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_price_label.frame)+10, CGRectGetMaxY(_description_label.frame)+10, MAINSCREEN.width/5, 20)];
        [_time_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
        
    }
    return _time_label;
}
-(UILabel *)joinAndComment_label
{
    if (!_joinAndComment_label) {
        _joinAndComment_label = [[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(_photo_img.frame)+15, MAINSCREEN.width/2.5, 20)];
        [_joinAndComment_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
        
    }
    return _joinAndComment_label;
}
-(UILabel *)unitPrice_label
{
    if (!_unitPrice_label) {
        _unitPrice_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_description_label.frame)+15, 25		, MAINSCREEN.width/2.5, 40)];
        [_unitPrice_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
        [_unitPrice_label setTextColor:[UIColor redColor]];
    }
    return _unitPrice_label;
}
-(UILabel *)oneClassTime_label
{
    if (!_oneClassTime_label) {
        _oneClassTime_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_description_label.frame)+35,CGRectGetMaxY(_unitPrice_label.frame)+3, MAINSCREEN.width/5, 20)];
        [_oneClassTime_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    }
    return _oneClassTime_label;
}
-(UIButton *)shoucang_button
{
    if (!_shoucang_button) {
        _shoucang_button = [UIButton buttonWithType:UIButtonTypeSystem];
        _shoucang_button.frame = CGRectMake(CGRectGetMaxX(_description_label.frame)+30,CGRectGetMinY(_joinAndComment_label.frame)-5, 30, 30);
        [_shoucang_button setImage:[UIImage imageNamed:@"shouchang"] forState:UIControlStateNormal];
    }
    return _shoucang_button;
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
