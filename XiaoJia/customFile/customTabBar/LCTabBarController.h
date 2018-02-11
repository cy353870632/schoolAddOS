//
//  LCTabBarController.h
//  LuoChang
//
//  Created by Rick on 15/4/29.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol shoppingBtnSelectdelegate <NSObject>

-(void)shoppingBtnSelect:(id)sender;

@end

@interface LCTabBarController : UITabBarController
@property(nonatomic,strong) UIView *mytabbar;
@property(nonatomic,strong) UIView *cameraView;
@property(nonatomic,strong) UIButton *cameraBtn;
@property(strong,nonatomic)id<shoppingBtnSelectdelegate>shoppingBtnSelectdelegate;
@end
