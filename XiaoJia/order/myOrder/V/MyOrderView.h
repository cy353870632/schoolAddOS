//
//  MyOrderView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol MyOrderDelegat <NSObject>

-(void)didselectSection:(NSInteger)section Row:(NSInteger)index TypeStatue:(NSInteger)type;

@end

@interface MyOrderView : CustomView
@property(strong,nonatomic)UITableView * order_tablerView;
@property(strong,nonatomic)id<MyOrderDelegat>delegat;
@end
