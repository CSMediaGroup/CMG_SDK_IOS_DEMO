//
//  SZAppDelegate.m
//  MYCSMedia
//
//  Created by majia5499531@163.com on 06/01/2021.
//  Copyright (c) 2021 majia5499531@163.com. All rights reserved.
//

#import "SZAppDelegate.h"
#import "SZViewController.h"
#import "LoginVC.h"
#import <SZManager.h>
#import "MJNav.h"
#import <MJHUD_Notice.h>


@interface SZAppDelegate ()<SZDelegate>

@end

@implementation SZAppDelegate


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //SDK配置
    [SZManager initWithAppId:@"9111184" appKey:@"00000" appDelegate:self enviroment:PRD_ENVIROMENT];
    
    //UI
    SZViewController * vc = [[SZViewController alloc]init];
    MJNav * nav = [[MJNav alloc]initWithRootViewController:vc];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - SZDelegate
-(SZUserInfo *)onGetUserInfo
{
    LoginVC * vc = [LoginVC sharedLoginVC];
    return vc.currentAccount;
}


-(void)onShareAction:(SZ_SHARE_PLATFORM)platform title:(NSString *)title image:(NSString *)imgurl desc:(NSString *)desc URL:(NSString *)url
{
    switch (platform)
    {
        case WECHAT_PLATFORM:
            
            [MJHUD_Notice showSuccessView:[NSString stringWithFormat:@"wechat_%@\n%@\n%@",title,desc,url] inView:self.window hideAfterDelay:2];
            break;
        case TIMELINE_PLATFORM:
            [MJHUD_Notice showSuccessView:[NSString stringWithFormat:@"timeline_%@\n%@\n%@",title,desc,url] inView:self.window hideAfterDelay:2];
            break;
        case QQ_PLATFORM:
            [MJHUD_Notice showSuccessView:[NSString stringWithFormat:@"qq_%@\n%@\n%@",title,desc,url] inView:self.window hideAfterDelay:2];
            break;
        default:
            break;
    }
}


-(void)onLoginAction
{
    LoginVC * vc = [LoginVC sharedLoginVC];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    
    UINavigationController * navvc = (UINavigationController*)self.window.rootViewController;
    [navvc presentViewController:vc animated:YES completion:nil];
}





@end
