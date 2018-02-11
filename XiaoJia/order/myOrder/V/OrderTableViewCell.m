//
//  OrderTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

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
        
    }
    return self;
}



-(UIImageView *)photo_img
{
    if(!_photo_img){
        _photo_img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, MAINSCREEN.width/4, MAINSCREEN.width/4+20)];
        _photo_img.layer.cornerRadius = 0.7;
        [_photo_img setImage:[UIImage imageNamed:@"icon_other"]];
    }
    return _photo_img;
}
-(UILabel *)title_label
{
    if (!_title_label) {
        _title_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+12, 15, MAINSCREEN.width/2.5, 20)];
        [_title_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        
    }
    return _title_label;
}
-(UILabel *)description_label
{
    if (!_description_label) {
        _description_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+12, CGRectGetMaxY(_title_label.frame)+5, MAINSCREEN.width/2.2, 20)];
        [_description_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        
    }
    return _description_label;
}
-(UILabel *)price_label
{
    if (!_price_label) {
        _price_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+12, CGRectGetMaxY(_description_label.frame)+5, MAINSCREEN.width/5, 20)];
        [_price_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        
    }
    return _price_label;
}
-(UILabel *)time_label
{
    if (!_time_label) {
        _time_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_price_label.frame)+10, CGRectGetMaxY(_description_label.frame)+5, MAINSCREEN.width/5, 20)];
        [_time_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        
    }
    return _time_label;
}
-(UILabel *)joinAndComment_label
{
    if (!_joinAndComment_label) {
        _joinAndComment_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photo_img.frame)+12, CGRectGetMaxY(_time_label.frame)+10, MAINSCREEN.width/2.5, 20)];
        [_joinAndComment_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        
    }
    return _joinAndComment_label;
}
-(UILabel *)unitPrice_label
{
    if (!_unitPrice_label) {
        _unitPrice_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_description_label.frame)+20, 35, MAINSCREEN.width/2.5, 40)];
        [_unitPrice_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
        [_unitPrice_label setTextColor:[UIColor redColor]];
    }
    return _unitPrice_label;
}
-(UILabel *)oneClassTime_label
{
    if (!_oneClassTime_label) {
        _oneClassTime_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_description_label.frame)+25,CGRectGetMaxY(_unitPrice_label.frame)+3, MAINSCREEN.width/5, 20)];
        [_oneClassTime_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    }
    return _oneClassTime_label;
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