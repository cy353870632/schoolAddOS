//
//  AddGroupViewController.h
//  MySchool
//
//  Created by 程远 on 16/10/24.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "CustomViewController.h"

@interface AddGroupViewController : CustomViewController

@property(nonatomic,strong)UITextField * groupName_textfield,* groupMiaoshu_textfield;
@property(strong,nonatomic)UITableView * haoyou_tableview;
@property(strong,nonatomic)UILabel * haoyou_label;
@end
