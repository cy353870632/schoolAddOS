//
//  Marquee.m
//  Marquee
//
//  Created by xin on 16/3/31.
//  Copyright © 2016年 LiuZeXin. All rights reserved.
//

#import "Marquee.h"
#define scrollerspeed 0.7 //滚动速度
@interface Marquee()

@property (nonatomic, weak) UIView * firstView;

//will reset position of self.contentOffset
@property (nonatomic, assign) CGFloat  displayX;

@end

@implementation Marquee

- (CADisplayLink *)timer{
    
    if (_timer == nil) {
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveInCircle)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)moveInCircle{
    
    if (self.contentOffset.x >= self.displayX ) {
        [self setContentOffset:CGPointZero];
    }
    self.contentOffset = CGPointMake(self.contentOffset.x + scrollerspeed * self.speed, 0);
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.isCenterVertical = YES;
        self.margin = 10;
        self.speed = 1;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    //max height
    CGFloat maxHeight = 0.0;
    //frame get width
    CGFloat width = 0.0;
    
 
    NSAssert(self.views.count >= 2, @"count of views must > 1");

    
    for (NSInteger i = 0; i < self.views.count; i++) {
        
        if ([self.views[i] isKindOfClass:[UIView class]]) {
            UIView * view = self.views[i];
            if (i == 0) {
                maxHeight = view.frame.size.height;
                if (self.isSingle) {
                    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, view.frame.size.width, view.frame.size.height);
                }
            }else{
                if (maxHeight < view.frame.size.height) {
                    maxHeight = view.frame.size.height;
                }
            }
            if (self.isCenterVertical) {
                
                CGFloat v_width = view.frame.size.width;
                CGFloat v_height = view.frame.size.height;
                CGFloat v_y = (self.frame.size.height - v_height) * 0.5;
                
                view.frame = CGRectMake(width, v_y, v_width, v_height);
            }
            [self addSubview:view];
            width += view.frame.size.width + self.margin;
            if (self.views.count - 2 == i) {
                self.displayX = width;
            }
        }
        
    }
    
    [self setContentSize:CGSizeMake(width, maxHeight)];
}

- (void)setViews:(NSMutableArray *)views{
    
    if (views == nil || views.count == 0) {
        return;
    }
    
    _views = views;
    
    if ([views[0] isKindOfClass:[UIView class]]) {
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:_views[0]];
        self.firstView = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [_views addObject:self.firstView];
        
    }
    
}

- (void)setIsUserInteraction:(BOOL)isUserInteraction{
    
    _isUserInteraction = isUserInteraction;
    self.userInteractionEnabled = isUserInteraction;
}

- (void)fire{
    
    [self timer];
}

- (void)stop{
    
    [self.timer invalidate];
}



@end
