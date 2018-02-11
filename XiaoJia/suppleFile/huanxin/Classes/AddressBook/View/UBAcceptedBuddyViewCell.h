//
//  UBAcceptedBuddyViewCell.h
//  UChat
//
//  Created by xsj on 16/1/19.
//  Copyright © 2016年 xusj. All rights reserved.
//  验证消息cell

#import <UIKit/UIKit.h>

@interface UBAcceptedBuddyViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
