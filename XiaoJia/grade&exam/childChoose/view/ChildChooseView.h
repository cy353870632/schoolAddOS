//
//  ChildChooseView.h
//  XiaoJia
//
//  Created by 程远 on 17/2/23.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "CustomView.h"

@protocol childChooseDeleget <NSObject>

-(void)chooseChild:(NSInteger)childIndexPath;
-(void)addChild;

@end
@interface ChildChooseView : CustomView
@property(strong,nonatomic)id<childChooseDeleget>deleget;
@property(strong,nonatomic)NSMutableArray * childName_array;
@end
