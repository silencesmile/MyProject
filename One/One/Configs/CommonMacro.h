
#ifndef LaShouGroup_6_0_CommonMacro_h
#define LaShouGroup_6_0_CommonMacro_h

#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif

/*
 *@bref  系统版本判断
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define kMainScreenWidth   ([UIScreen mainScreen].applicationFrame).size.width //应用程序的宽度
#define kMainScreenHeight   ([UIScreen mainScreen].applicationFrame).size.height //应用程序的高度
#define kMainBoundsHeight   ([UIScreen mainScreen].bounds).size.height //屏幕的高度
#define kMainBoundsWidth    ([UIScreen mainScreen].bounds).size.width //屏幕的宽度
#define kViewSizeWidth      (self.view.frame.size.width)
#define kViewSizeHeight     (self.view.frame.size.height)

#define kVersion                        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define kIsIOS7                         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define kIsIOS8                         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define kIsIphone6P                     ([[UIScreen mainScreen] bounds].size.height == 736)
#define kIsIphone6                      ([[UIScreen mainScreen] bounds].size.height == 667)
#define kIsIphone5                      ([[UIScreen mainScreen] bounds].size.height == 568)
#define kIsIphone4                      ([[UIScreen mainScreen] bounds].size.height == 480)
#define kIsSimulator                    (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)   // 是否模拟器

#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define RGB(r, g, b) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]

#define kColorNavBg                     RGBA(255, 111, 90, 1)  
#define kColorViewControllerBg          RGBA(242, 242, 242, 1.f)
#define kColorGrayText                  RGBA(153, 153, 153, 1.f)
#define kColorGrayLine                  RGBA(238, 238, 238, 1.f)
#define kColorSeparateLine              RGBA(216, 216, 216, 1.f)
#define kColorRandom                    RGB((float)(rand() % 255), (float)(rand() % 255), (float)(rand() % 255))

#define kViewControllerHeadHeight (kIsIOS7 ? 64 : 44)

#define kUserDefaultSendGifCount            @"kUserDefaultSendGifCount"
#define kUserDefaultLaunchCount             @"kUserDefaultLaunchCount"
#define kUserDefaultShareList               @"kUserDefaultShareList"

#define kNotificationDownloadProgress       @"kNotificationDownloadProgress"
#define kNotificationDownloadDone           @"kNotificationDownloadDone"
#define kNotificationDownloadFail           @"kNotificationDownloadFail"
#define kNotificationGifRemove              @"kNotificationGifRemove"
#define kNotificationShareToWX              @"kNotificationShareToWX"
#define kNotificationShareSuccess           @"kNotificationShareSuccess"
#define kNotificationLaunchFromKeyboard     @"kNotificationLaunchFromKeyboard"
#define kNotificationGifSortList            @"kNotificationGifSortList"
#define kNotificationShowGuide              @"kNotificationShowGuide"
#define kNotificationFirstIn                @"kNotificationFirstIn"
#define kNotificationFirstInFinished        @"kNotificationFirstInFinished"



#endif
