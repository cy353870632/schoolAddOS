//
//  BasicsMessageViewController.h
//  XiaoJia
//
//  Created by 程远 on 17/3/13.
//  Copyright © 2017年 程远. All rights reserved.
//基本资料页

#import "CustomViewController.h"

@protocol BasicsMessageViewdelegat <NSObject>

-(void)showPersonCenter;

@end

@interface BasicsMessageViewController : CustomViewController
@property(strong,nonatomic)id<BasicsMessageViewdelegat>deleget;
@end
