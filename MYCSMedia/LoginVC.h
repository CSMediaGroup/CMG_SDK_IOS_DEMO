//
//  LoginVC.h
//  CSVideoDemo
//
//  Created by 马佳 on 2021/5/28.
//

#import <UIKit/UIKit.h>
#import "SZManager.h"



@interface LoginVC : UIViewController

+(instancetype)sharedLoginVC;

@property(strong,nonatomic)SZUserInfo * account1;
@property(strong,nonatomic)SZUserInfo * account2;
@property(strong,nonatomic)SZUserInfo * currentAccount;



@end


