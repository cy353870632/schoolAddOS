//
//  HomeWorkView.h
//  MySchool
//
//  Created by 程远 on 16/10/25.
//  Copyright © 2016年 程远. All rights reserved.
//

#import "HomeWorkView.h"

@protocol selectCellDeleget <NSObject>
-(void)didSelectCell:(NSString *)title;

@end

@interface HomeWorkView : CustomView

@property(strong,nonatomic)UITableView * homework_tableview;
@property(strong,nonatomic)UIView * moveView;//橙色滚动条
@property(strong,nonatomic)id<selectCellDeleget>deleget;
@end
