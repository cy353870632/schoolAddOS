//
//  AppDelegate.m
//  XiaoJia
//
//  Created by 程远 on 17/2/22.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "AppDelegate.h"
#import "UBSessionViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    //指定视图窗口大小，指定背景颜色
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.window setBackgroundColor:[UIColor whiteColor]];
//    LCTabBarController * lcTabBarController = [[LCTabBarController alloc]init];
//    [self.window setRootViewController:lcTabBarController];
//    [self.window makeKeyAndVisible];
   // 登陆页
    LoginViewController * loginViewController = [[LoginViewController alloc]init];
    [self.window setRootViewController:loginViewController];
    [self.window makeKeyAndVisible];
    //注册环形
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"1165161018115007#xiaojia" apnsCertName:@""];
    [[EaseMob sharedInstance] application:application
            didFinishLaunchingWithOptions:launchOptions];
       ////欢迎页
    //只运行一次
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *launched = [userDefaults objectForKey:@"launched"];
        if (!launched)
        {
            [self guidePages];
            launched = @"YES";
            [userDefaults setObject:launched forKey:@"launched"];
            [userDefaults synchronize];
            
            
        }
//    //一直运行
//    [self guidePages];
    
    return YES;
}
- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[ @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg" ];
    //  初始化方法1
    MZGuidePages *mzgpc = [[MZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(MZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:2.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    //  初始化方法2
    //    MZGuidePagesController *mzgpc = [[MZGuidePagesController alloc]
    //    initWithImageDatas:imageArray
    //                                                                            completion:^{
    //                                                                              NSLog(@"click!");
    //
    //要在makeKeyAndVisible之后调用才有效
    [self.window addSubview:mzgpc];
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}



- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
