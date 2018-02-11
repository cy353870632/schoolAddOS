//
//  SchoolChooseView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/17.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol SchoolChooseViewDeleget <NSObject>
-(void)schoolNameChoose:(NSInteger)index;
@end

@interface SchoolChooseView : CustomView
@property(strong,nonatomic)UITableView * schoolChoose_tableview;
@property(strong,nonatomic)id<SchoolChooseViewDeleget>delegat;
@end
