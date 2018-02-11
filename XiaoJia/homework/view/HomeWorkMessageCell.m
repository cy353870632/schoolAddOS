//
//  HomeWorkMessageCell.m
//  XiaoJia
//
//  Created by 程远 on 17/3/28.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "HomeWorkMessageCell.h"

@implementation HomeWorkMessageCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self.contentView addSubview:self.homewrokmessage_label];
    }
    return self;
}
-(UILabel *)homewrokmessage_label
{
    if (!_homewrokmessage_label) {
        _homewrokmessage_label = [[UILabel alloc]init];
        _homewrokmessage_label.font = [UIFont fontWithName:@"Helvetica" size:14];
        _homewrokmessage_label.numberOfLines = 0;
        [_homewrokmessage_label setLineBreakMode:NSLineBreakByCharWrapping];
    }
    return _homewrokmessage_label;
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
