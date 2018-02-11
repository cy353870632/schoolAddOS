//
//  PersonTableViewCell.m
//  MySchool
//
//  Created by 程远 on 16/10/18.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title_img.frame = CGRectMake(60, 8, 30, 30);
        [self.contentView addSubview:self.title_img];
        
        self.title_label.frame = CGRectMake(CGRectGetMaxX(self.title_img.frame)+10, 10, 100, 35);
        [self.contentView addSubview:self.title_label];
        
        
    }
    return self;
}


-(UIImageView *)title_img
{
    if (!_title_img) {
        _title_img = [[UIImageView alloc]init];
    }
    return _title_img;
}
-(UILabel *)title_label
{
    if (!_title_label) {
        _title_label = [[UILabel alloc]init];
        [_title_label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    }
    return _title_label;
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
