#ifdef LITEAV
#import "TXVodPlayer.h"
#import "TXLivePlayer.h"
#import "TXImageSprite.h"
#import "TXLiveBase.h"
#else

#import <TXLiteAVSDK_UGC/TXLiteAVSDK.h>

#endif

#import "SuperPlayerView.h"
#import "SuperPlayerModel.h"
#import "SuperPlayerControlView.h"
#import "SuperPlayerControlViewDelegate.h"
#import "SuperPlayerWindow.h"
#import "SPDefaultControlView.h"




// player的单例
#define SuperPlayerShared                   [SuperPlayerSharedView sharedInstance]
// 屏幕的宽
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
// 屏幕的高
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
// 颜色值RGB
#define RGBA(r,g,b,a)                       [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
// 图片路径
#define SuperPlayerImage(file)              [UIImage imageNamed:[@"CSAssets.bundle/playerImages" stringByAppendingPathComponent:file]]

#define IsIPhoneX                           (ScreenHeight >= 812 || ScreenWidth >= 812)

// 小窗单例
#define SuperPlayerWindowShared             [SuperPlayerWindow sharedInstance]

#define TintColor RGBA(252, 89, 81, 1)

#define LOG_ME NSLog(@"%s", __func__);
