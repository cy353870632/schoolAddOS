//
//  ShouCangView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/20.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@interface ShouCangView : CustomView
@property(strong,nonatomic)UITableView * peixun_tableView;
@property(strong,nonatomic)NSMutableArray * fenlei_array;//大分类按钮array
@property(strong,nonatomic)NSMutableArray * shopping_array;//tableview数据array
@end
