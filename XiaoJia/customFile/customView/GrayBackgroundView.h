//
//  GrayBackgroundView.h
//  XiaoJia
//
//  Created by 程远 on 17/2/24.
//  Copyright © 2017年 程远. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GrayBackgroundViewDeleget <NSObject>

-(void)didselectGrayBackGroundView;

@end

@interface GrayBackgroundView : UIView
@property(strong,nonatomic)id<GrayBackgroundViewDeleget>deleget;

@end
