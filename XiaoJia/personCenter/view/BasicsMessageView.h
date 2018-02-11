//
//  BasicsMessageView.h
//  XiaoJia
//
//  Created by 程远 on 17/3/13.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol cancelDelegat <NSObject>

-(void)cancelBingDing:(NSInteger)index;

@end

@interface BasicsMessageView : CustomView
- (instancetype)initWithFrame:(CGRect)frame withStudentNo:(NSInteger)studentNo;
@property(strong,nonatomic)id<cancelDelegat>delegat;

@end
