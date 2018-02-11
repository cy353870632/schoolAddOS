//
//  AddGroupTableViewCell.h
//  MySchool
//
//  Created by 程远 on 16/10/24.
//  Copyright © 2016年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol selectHaoYou <NSObject>

-(void)selectHaoYou:(NSInteger)sender;
-(void)quxiaoHaoYou:(NSInteger)sender;

@end

@interface AddGroupTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel * userName_label;
@property(strong,nonatomic)UIImageView * select_img;
@property(assign,nonatomic)id<selectHaoYou>deleget;
@end
