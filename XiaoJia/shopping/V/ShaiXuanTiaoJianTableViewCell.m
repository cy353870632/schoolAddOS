//
//  ShaiXuanTiaoJianTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/4/10.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ShaiXuanTiaoJianTableViewCell.h"

@implementation ShaiXuanTiaoJianTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.label];
    }
    return self;
}

-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN.width/10, 5, MAINSCREEN.width-40, 20)];
        _label.textColor = [UIColor grayColor];
        
    }
    return _label;
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
