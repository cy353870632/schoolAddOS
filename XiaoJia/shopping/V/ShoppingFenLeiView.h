//
//  ShoppingFenLeiView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/6.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@interface ShoppingFenLeiView : CustomView
@property(strong,nonatomic)UITableView * peixun_tableView;
@property(strong,nonatomic)UITableView * shaixuan_tableView;
@property(strong,nonatomic)NSMutableArray * shopping_array;//tableview数据array
@end
