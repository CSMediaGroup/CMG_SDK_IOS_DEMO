//
//  SZViewController.m
//  MYCSMedia
//
//  Created by majia5499531@163.com on 06/01/2021.
//  Copyright (c) 2021 majia5499531@163.com. All rights reserved.
//


#import "SZViewController.h"
#import "SZContentListVC.h"
#import "IQDataBinding.h"
#import "LoginVC.h"
#import <SZMediaVC.h>


#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define STATUS_BAR_HEIGHT           [UIApplication sharedApplication].statusBarFrame.size.height
#define NAVI_HEIGHT                 ([UIApplication sharedApplication].statusBarFrame.size.height+\
                                    self.navigationController.navigationBar.frame.size.height)

@interface SZViewController ()
{
    UISwitch * loginSwitch;
    UISwitch * modeSwitch;
    
    BOOL isFullMode;
}



@end

@implementation SZViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initSubviews];
    
    [self addDataBinding];
}

-(void)initSubviews
{
    //bg
    self.view.backgroundColor=[UIColor whiteColor];
        
    //label
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, NAVI_HEIGHT+20, 60, 30)];
    label.text=@"登录状态";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    
    //login indicator
    loginSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, label.frame.origin.y, 30, 30)];
    loginSwitch.alpha=0.25;
    loginSwitch.userInteractionEnabled=NO;
    [loginSwitch addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginSwitch];
    
    //login button
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(loginSwitch.frame.origin.x+loginSwitch.frame.size.width+40, loginSwitch.frame.origin.y, 100, 30)];
    loginBtn.backgroundColor=[UIColor brownColor];
    [loginBtn setTitle:@"登录页" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //homepage
    UIButton * btn0 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-30-100, 200, 30)];
    btn0.backgroundColor=[UIColor brownColor];
    [btn0 setTitle:@"首页" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(homepageBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn0];
    
    //api
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-30-200, 200, 30)];
    btn2.backgroundColor=[UIColor brownColor];
    [btn2 setTitle:@"内容列表" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(apiBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}




#pragma mark - DataBinding
//监听登陆状态
-(void)addDataBinding
{
    LoginVC * login = [LoginVC sharedLoginVC];
    [self bindModel:login];
    
    __weak typeof (self) weakSelf = self;
    self.observe(@"currentAccount",^(id value){
        [weakSelf updateLoginInfoView:value];
    });
}

//监听登陆状态
-(void)updateLoginInfoView:(id)data
{
    if ([data isKindOfClass:[NSNull class]])
    {
        loginSwitch.on = NO;
    }
    else
    {
        loginSwitch.on = YES;
    }
}




#pragma mark - Btn Actions
//登陆按钮
-(void)loginBtnAction
{
    LoginVC * vc = [LoginVC sharedLoginVC];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

//跳转首页
-(void)homepageBtnAction
{
    SZMediaVC * web = [[SZMediaVC alloc]init];
    [self.navigationController pushViewController:web animated:YES];
}

//API按钮
-(void)apiBtnAction
{
    SZContentListVC * vc = [[SZContentListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}




#pragma mark - Status bar
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}


@end
