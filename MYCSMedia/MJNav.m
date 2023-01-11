//
//  MJNav.m
//  MYCSMedia_Example
//
//  Created by 马佳 on 2021/6/18.
//  Copyright © 2021 majia5499531@163.com. All rights reserved.
//

#import "MJNav.h"

@interface MJNav ()

@end

@implementation MJNav

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
}

#pragma mark - StatusBar
-(UIStatusBarStyle)preferredStatusBarStyle
{
    UIViewController * topvc = self.topViewController;
    return [topvc preferredStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden
{
    UIViewController * topvc = self.topViewController;
    return [topvc prefersStatusBarHidden];
}

@end
