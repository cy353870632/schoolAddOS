//
//  OrderTableViewCell.h
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell
@property(strong,nonatomic)UIImageView * photo_img;
@property(strong,nonatomic)UILabel * title_label;
@property(strong,nonatomic)UILabel * description_label;
@property(strong,nonatomic)UILabel * price_label;//总计费用
@property(strong,nonatomic)UILabel * time_label;//总计课时
@property(strong,nonatomic)UILabel * joinAndComment_label;
@property(strong,nonatomic)UILabel * oneClassTime_label;//1课时
@property(strong,nonatomic)UILabel * unitPrice_label;//每课时费用
@end
