//
//  GradeCeshiView.h
//  XiaoJia
//
//  Created by 程远 on 17/5/8.
//  Copyright © 2017年 程远. All rights reserved.
//成绩报告页面，具体成绩测试页面

#import <UIKit/UIKit.h>

@protocol GradeCeshiViewdelegat <NSObject>

-(void)startTest:(NSInteger)index;

@end

@interface GradeCeshiView : UIView
@property(strong,nonatomic)UILabel * title_label;
@property(strong,nonatomic)UILabel * grade_label;
@property(strong,nonatomic)UIButton * start_button;
@property(strong,nonatomic)id<GradeCeshiViewdelegat>delegat;
@end
