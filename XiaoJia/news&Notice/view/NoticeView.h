//
//  NoticeView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/21.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"


@protocol noticeViewDelegat <NSObject>

-(void)didselectNotice:(NSInteger)noticeId;//这个后面传通知的id

@end
@interface NoticeView : CustomView

@property(strong,nonatomic)UITableView * homework_tableview;
@property(strong,nonatomic)UIView * moveView;//橙色滚动条
@property(strong,nonatomic)id<noticeViewDelegat>deleget;
@end
