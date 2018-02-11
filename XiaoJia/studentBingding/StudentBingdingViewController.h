//
//  StudentBingdingViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/4/13.
//  Copyright © 2017年 程远. All rights reserved.
// 关系绑定页面

#import "CustomViewController.h"

@protocol StudentBingDingControllerDelegat <NSObject>

-(void)studentbingdingShowPersonCenter;

@end

@interface StudentBingdingViewController : CustomViewController
@property(strong,nonatomic)id<StudentBingDingControllerDelegat>delegat;
@end
