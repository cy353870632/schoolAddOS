//
//  ChildChooseTableViewCell.m
//  XiaoJia
//
//  Created by 程远 on 17/2/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "ChildChooseTableViewCell.h"


@interface ChildChooseTableViewCell()
{
    CGSize selfScreen;
}

@end
@implementation ChildChooseTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewSize:(CGSize)viewSize
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        selfScreen = viewSize;
        [self.contentView addSubview:self.childName_label];
        [self.contentView addSubview:self.addChild_imageView];
    }
    
    
    return self;
    
}

-(UILabel *)childName_label
{
    if (!_childName_label) {
        _childName_label = [[UILabel alloc]initWithFrame:CGRectMake(17, 10, 100, 30)];
        _childName_label.textColor = gray_color;
        _childName_label.textAlignment = UITextAlignmentCenter;
        [_childName_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        _childName_label.hidden = YES;
    }
    return _childName_label;
}
-(UIImageView *)addChild_imageView
{
    if (!_addChild_imageView) {
        _addChild_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(45, 0, 40, 40)];
        [_addChild_imageView setImage:[UIImage imageNamed:@"chat_toolbar_more_press"]];
        _addChild_imageView.hidden = YES;
    }
    return _addChild_imageView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
