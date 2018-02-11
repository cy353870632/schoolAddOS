//
//  ShoppingScrollerView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/1.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol shoppingscrollerViewdelegate <NSObject>

-(void)moveShoppingViewToUp;
-(void)moveShoppingViewToDown;
-(void)didselectFenLeiButton:(NSInteger *)index;
@end

@interface ShoppingScrollerView : UIScrollView

@property(strong,nonatomic)UITableView * peixun_tableView;
@property(strong,nonatomic)NSMutableArray * fenlei_array;//大分类按钮array
@property(strong,nonatomic)NSMutableArray * shopping_array;//tableview数据array
- (instancetype)initWithFrame:(CGRect)frame scrollerViewHight:(NSInteger)hight fenleiArray:(NSMutableArray *)fenleiArray;
@property(strong,nonatomic)id<shoppingscrollerViewdelegate>shoppingscrollerViewdelegate;
@end
