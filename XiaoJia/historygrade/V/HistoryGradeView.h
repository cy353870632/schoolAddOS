//
//  HistoryGradeView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/19.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol histroyGradedelegat <NSObject>

-(void)didseclect:(NSInteger)historyGradeId;

@end

@interface HistoryGradeView : CustomView
@property(strong,nonatomic)UITableView * historyGrade_tableview;
@property(strong,nonatomic)id<histroyGradedelegat>delegat;
@end
