//
//  LoginTypeView.h
//  XiaoJia
//
//  Created by 程远 on 17/4/30.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginTypeViewDelegat <NSObject>

-(void)didselect:(NSInteger)index;

@end

@interface LoginTypeView : UIView
- (instancetype)initWithFrame:(CGRect)frame LogoHeight:(NSInteger)height;
@property(strong,nonatomic)id<LoginTypeViewDelegat>delegat;
@end
