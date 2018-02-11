//
//  NewsTableViewCell.m
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.news_ImgBig.frame = CGRectMake(0, 0, MAINSCREEN.width-20,MAINSCREEN.height/4);
        [self.contentView addSubview:self.news_ImgBig];
        
        self.news_ImgSamll.frame = CGRectMake(15, 8, self.frame.size.width/5.6, self.frame.size.width/5.6);
        [self.contentView addSubview:self.news_ImgSamll];
        
        self.news_labelBig.frame = CGRectMake(0, CGRectGetMaxY(self.news_ImgBig.frame)-40, MAINSCREEN.width-20, 40);
        [self.contentView addSubview:self.news_labelBig];
        
        self.news_labelSmall.frame = CGRectMake(CGRectGetMaxX(
                                                              self.news_ImgSamll.frame)+20, 20, self.frame.size.width-45, 40);
        [self.contentView addSubview:self.news_labelSmall];
    }
    return self;
}
-(UIImageView *)news_ImgBig
{
    if (!_news_ImgBig) {
        _news_ImgBig = [[UIImageView alloc]init];
        _news_ImgBig.layer.cornerRadius = 7;
        _news_ImgBig.clipsToBounds = YES;
        _news_ImgBig.image = [UIImage imageNamed:@"haizeiwang1"];
    }
    return _news_ImgBig;
}
-(UIImageView *)news_ImgSamll
{
    if (!_news_ImgSamll) {
        _news_ImgSamll = [[UIImageView alloc]init];
        _news_ImgSamll.layer.cornerRadius = 7;
        _news_ImgSamll.clipsToBounds = YES;
        _news_ImgSamll.image = [UIImage imageNamed:@"haizeiwang2"];
    }
    return _news_ImgSamll;
}
-(UILabel *)news_labelBig
{
    if (!_news_labelBig) {
        _news_labelBig = [[UILabel alloc]init];
        _news_labelBig.font = [UIFont fontWithName:@"Helvetica" size:14];
        _news_labelBig.layer.cornerRadius = 7;
        _news_labelBig.backgroundColor = [UIColor grayColor];
        _news_labelBig.textColor = [UIColor whiteColor];
        _news_labelBig.text = @"因为准备在项目中使用bootstrap，在安装bootstrap过程中提示需要Ruby的版本在1.9.2以上，而目前使用的Ruby版本是Mac系统自带的1.8.7。所以需要对Ruby进行升级。这里使用RVM对Ruby进行升级，升级过程如下";
    }
    return _news_labelBig;
}
-(UILabel *)news_labelSmall
{
    if (!_news_labelSmall) {
        _news_labelSmall = [[UILabel alloc]init];
        _news_labelSmall.font = [UIFont fontWithName:@"Helvetica" size:14];
        _news_labelSmall.text = @"因为准备在项目中使用bootstrap，在安装bootstrap过程中提示需要Ruby的版本在1.9.2以上，而目前使用的Ruby版本是Mac系统自带的1.8.7。所以需要对Ruby进行升级。这里使用RVM对Ruby进行升级，升级过程如下";
    }
    return _news_labelSmall;
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
