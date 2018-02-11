//
//  NewsTableViewCell.h
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property(strong,nonatomic)UIImageView * news_ImgBig;
@property(strong,nonatomic)UIImageView * news_ImgSamll;
@property(strong,nonatomic)UILabel * news_labelBig;
@property(strong,nonatomic)UILabel * news_labelSmall;

@end
