//
//  HomeWorkMessageViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/3/3.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomViewController.h"

@interface HomeWorkMessageViewController : CustomViewController
@property(strong,nonatomic)NSMutableArray * homeWorkMessage_array;
@property(strong,nonatomic)UITableView * homeWork_tableView;
@property(strong,nonatomic)HomeWorkMessageCell * cell;
@end
