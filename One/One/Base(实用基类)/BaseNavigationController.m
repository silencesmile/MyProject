//
//  BaseNavigationController.m
//  One
//
//  Created by youngstar on 16/5/17.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () <UINavigationBarDelegate>

@end

@implementation BaseNavigationController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor * color = [UIColor yellowColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    
    self.navigationBar.translucent = NO;
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    // 设置navigationBar的背景颜色
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#d53736"]];
//        [self.navigationBar setTintColor:[UIColor redColor]];
    }
    else
    {
        [self.navigationBar setTintColor:kColorNavBg];
//        [self.navigationBar setTintColor:[UIColor redColor]];
    }
}

@end
