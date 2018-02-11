//
//  Marquee.h
//  Marquee
//
//  Created by xin on 16/3/31.
//  Copyright © 2016年 LiuZeXin. All rights reserved.
// 跑马灯

#import <UIKit/UIKit.h>

//NSString * const left = @"left";
//NSString * const right = @"right";
/*
 Marquee is move in cycles, you must user this method "initWithFrame" to create it
 */
@interface Marquee : UIScrollView

//Timer
@property (nonatomic, strong) CADisplayLink * timer;

//Views you can put some view in this Array, it will be show(NOTICE MUST NOT BE nil)
@property (nonatomic, strong) NSMutableArray * views;

//default is no
@property (nonatomic, assign) BOOL isUserInteraction;

// is centerVertical
@property (nonatomic, assign) BOOL  isCenterVertical;

//direction
//@property (nonatomic, copy) NSString * direction;

//margin between view an view
@property (nonatomic, assign) CGFloat  margin;

//multiple of speed
@property(nonatomic, assign)int speed;

//default is no singleMode
@property (nonatomic, assign) BOOL  isSingle;

-(void)fire;
-(void)stop;
@end
