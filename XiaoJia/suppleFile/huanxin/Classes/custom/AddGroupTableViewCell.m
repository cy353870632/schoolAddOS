//
//  AddGroupTableViewCell.m
//  MySchool
//
//  Created by 程远 on 16/10/24.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "AddGroupTableViewCell.h"
@interface AddGroupTableViewCell()
{
    int status;
}
@end
@implementation AddGroupTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        status = 0;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithWhite:0.962 alpha:1.000].CGColor;
        if (MAINSCREEN.width == 320) {
            
        }else{
            self.select_img.frame = CGRectMake(self.frame.size.width/15, self.frame.size.width/20, self.frame.size.width/17, self.frame.size.width/17);
            self.userName_label.frame = CGRectMake(CGRectGetMaxY(self.select_img.frame)+10, self.frame.size.width/20, self.frame.size.width/1.1,self.frame.size.width/17);
            
        }
        
        [self.contentView addSubview:self.select_img];
        [self.contentView addSubview:self.userName_label];
    }
    return self;
    
}
-(UILabel *)userName_label
{
    if (!_userName_label) {
        _userName_label = [[UILabel alloc]init];
        [self.userName_label setFont:[UIFont systemFontOfSize:14]];
    }
    return _userName_label;
}
-(UIImageView *)select_img
{
    if (!_select_img) {
        _select_img = [[UIImageView alloc]init];
        _select_img.image = [UIImage imageNamed:@"aio_voice_operate_nor"];
        _select_img.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectImgClick)];
        [_select_img addGestureRecognizer:tap];
        
    }
    return _select_img;
}
-(void)selectImgClick
{
    if (status == 0) {
         _select_img.image = [UIImage imageNamed:@"xuznhong"];
        status = 1;
        [self.deleget selectHaoYou:_select_img.tag];
        
    }else
    {
        _select_img.image = [UIImage imageNamed:@"aio_voice_operate_nor"];
        status = 0;
        [self.deleget quxiaoHaoYou:_select_img.tag];
    }
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
