//
//  HomeWorkView.h
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "LeavingView.h"

@protocol selectLeavingCellDeleget <NSObject>

-(void)didSelectCell:(NSInteger)index;

@end

@interface LeavingView : CustomView

@property(strong,nonatomic)UITableView * homework_tableview;
@property(strong,nonatomic)UIView * moveView;//橙色滚动条
@property(strong,nonatomic)id<selectLeavingCellDeleget>deleget;
@end
