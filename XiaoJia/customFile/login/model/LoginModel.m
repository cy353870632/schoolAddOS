//
//  LoginModel.m
//  XiaoJia
//
//  Created by 程远 on 17/5/15.
//  Copyright © 2017年 程远. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
+(void)loginRequestSuccess:(goodsInfo)block{
    LoginModel * loginModel = [[LoginModel alloc]init];
    [loginModel loginHuanXin];
}
-(void)loginHuanXin{
    NSString *username = @"13000000001";
    NSString *password = @"123456";
    //异步登陆账号
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username
                                                        password:password
                                                      completion:
     ^(NSDictionary *loginInfo, EMError *error) {
         //讯飞语音注册
         NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"591920dd"];
         [IFlySpeechUtility createUtility:initString];
         
         if (loginInfo && !error) {
             
             NSLog(@"登录成功");
             //设置是否自动登录
             [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
             //获取数据库中数据
             [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
             
             //获取群组列表
             [[EaseMob sharedInstance].chatManager asyncFetchMyGroupsList];
             
             [[NSUserDefaults standardUserDefaults] setObject:@{@"username":username,@"password":password} forKey:@"loginInfo"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
//             [self joinChatroom:@"1494489341286"];//首次上来加入群组
             
             LCTabBarController *vc = [[LCTabBarController alloc] init];
             
             [UIApplication sharedApplication].keyWindow.rootViewController = vc;
         }
         else
         {
             if (error.errorCode==EMErrorServerTooManyOperations) { /// 已经登录
                 NSLog(@"已经登录");
                 [[NSUserDefaults standardUserDefaults] setObject:@{@"username":username,@"password":password} forKey:@"loginInfo"];
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 
                 LCTabBarController *vc = [[LCTabBarController alloc] init];
                 [UIApplication sharedApplication].keyWindow.rootViewController = vc;
                 return ;
             }
             
         }
     } onQueue:nil];
}
//加入群组！用户首次注册完登录的时候，吧该用户添加到该班级的群组里
- (void)joinChatroom:(NSString *)chatroomId
{
    __weak typeof(self) weakSelf = self;
    [[EaseMob sharedInstance].chatManager asyncJoinChatroom:chatroomId completion:^(EMChatroom *chatroom, EMError *error){
        if (weakSelf)
        {
            
            if (error && (error.errorCode != EMErrorChatroomJoined))//失败了
            {
                NSLog(@"加入群组失败");
            }
            else//成功了
            {
                NSLog(@"加入群组成功");
            }
        }
        else
        {
            if (!error || (error.errorCode == EMErrorChatroomJoined))
            {
                [[EaseMob sharedInstance].chatManager asyncLeaveChatroom:chatroomId completion:^(EMChatroom *chatroom, EMError *error){
                    [[EaseMob sharedInstance].chatManager removeConversationByChatter:chatroomId deleteMessages:YES append2Chat:YES];
                }];
            }
        }
    }];
}

@end
