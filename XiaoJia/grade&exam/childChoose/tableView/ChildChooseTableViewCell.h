//
//  ChildChooseTableViewCell.h
//  XiaoJia
//
//  Created by 程远 on 17/2/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChildChooseTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel * childName_label;
@property(strong,nonatomic)UIImageView * addChild_imageView;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewSize:(CGSize)viewSize;

@end
