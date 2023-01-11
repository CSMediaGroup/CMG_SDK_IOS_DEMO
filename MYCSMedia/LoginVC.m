//
//  LoginVC.m
//  CSVideoDemo
//
//  Created by 马佳 on 2021/5/28.
//

#import "LoginVC.h"
#import "SZAppDelegate.h"

#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define STATUS_BAR_HEIGHT           [UIApplication sharedApplication].statusBarFrame.size.height

@interface LoginVC ()
{
    UISwitch * loginSwitch;
    UISwitch * loginSwitch2;
}
@end

@implementation LoginVC



+ (instancetype)sharedLoginVC
{

        static LoginVC * vc = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (vc == nil)
            {
                vc = [[LoginVC alloc]init];
                
                SZUserInfo * user1 = [[SZUserInfo alloc]init];
                user1.userid = @"1000002";
                user1.avatarUrl = @"https://img0.baidu.com/it/u=3818996098,538497867&fm=253&fmt=auto&app=138&f=JPEG?w=262&h=289";
                user1.nickname = @"高锰酸钾";
                user1.mobile = @"15800000002";
                vc.account1 = user1;
                
                

                
                SZUserInfo * user2 = [[SZUserInfo alloc]init];
                user2.userid = @"3937413";
                user2.avatarUrl = @"https://web.chinamcloud.com/member/member_default.png";
                user2.nickname = @"用户1824926";
                user2.mobile = @"17376584982";
                vc.account2= user2;
                
                
//                vc.currentAccount = vc.account1;
            }
            });
        return vc;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    label.text=@"登录";
    label.font=[UIFont systemFontOfSize:30];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-160, SCREEN_HEIGHT/2-100, 60, 30)];
    label1.text=@"登录账号1";
    label1.textAlignment=NSTextAlignmentCenter;
    label1.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:label1];
    
    loginSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-100, 30, 30)];
    [loginSwitch addTarget:self action:@selector(swithAction:) forControlEvents:UIControlEventValueChanged];
    loginSwitch.tag=0;
    [self.view addSubview:loginSwitch];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-160, SCREEN_HEIGHT/2-50, 60, 30)];
    label2.text=@"登录账号2";
    label2.textAlignment=NSTextAlignmentCenter;
    label2.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:label2];
    
    loginSwitch2 = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-50, 30, 30)];
    [loginSwitch2 addTarget:self action:@selector(swithAction:) forControlEvents:UIControlEventValueChanged];
    loginSwitch2.tag=1;
    [self.view addSubview:loginSwitch2];
    
    UIButton * dissmissBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2+100, 200, 30)];
    dissmissBtn.backgroundColor=[UIColor blackColor];
    [dissmissBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [dissmissBtn addTarget:self action:@selector(dissMissAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dissmissBtn];
    
    
    if (self.currentAccount)
    {
        if (self.currentAccount == self.account1)
        {
            loginSwitch.on=YES;
        }
        else
        {
            loginSwitch2.on=YES;
        }
    }
    
}



-(void)swithAction:(UISwitch*)swith
{
    if (swith.tag==0)
    {
        if (swith.on)
        {
            self.currentAccount = self.account1;
            loginSwitch2.on=NO;
        }
        else
        {
            self.currentAccount = nil;
        }
    }
    
    else
    {
        if (swith.on)
        {
            self.currentAccount = self.account2;
            loginSwitch.on=NO;
        }
        else
        {
            self.currentAccount = nil;
        }
    }
}


#pragma mark - Btn Action
-(void)dissMissAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
