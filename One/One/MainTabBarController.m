//
//  MainTabBarController.m
//  One
//
//  Created by youngstar on 16/5/17.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "MainTabBarController.h"
#import "ViewController.h"
#import "SetViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "Base(实用基类)/BaseNavigationController.h"

@interface MainTabBarController ()

@property (nonatomic, strong) ViewController *homeController;
@property (nonatomic, strong) SetViewController *setController;
@property (nonatomic, strong) OneViewController *oneController;
@property (nonatomic, strong) TwoViewController *twoController;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.homeController = [[ViewController alloc]init];
    _homeController.tabBarItem.title = @"首页";
    _homeController.tabBarItem.image = [UIImage imageNamed:@"tab1"];
    BaseNavigationController *homeNavigation = [[BaseNavigationController alloc]initWithRootViewController:_homeController];
    
    
    self.oneController = [[OneViewController alloc]init];
    _oneController.tabBarItem.title = @"列表";
    _oneController.tabBarItem.image = [UIImage imageNamed:@"tab2"];
    BaseNavigationController *oneNavigation = [[BaseNavigationController alloc]initWithRootViewController:_oneController];

    
    self.twoController = [[TwoViewController alloc]init];
    _twoController.tabBarItem.title = @"我的";
    _twoController.tabBarItem.image = [UIImage imageNamed:@"tab3"];
    BaseNavigationController *twoNavigation = [[BaseNavigationController alloc]initWithRootViewController:_twoController];

    
    self.setController = [[SetViewController alloc]init];
    _setController.tabBarItem.title = @"设置";
    _setController.tabBarItem.image = [UIImage imageNamed:@"tab4"];
    BaseNavigationController *setNavigation = [[BaseNavigationController alloc]initWithRootViewController:_setController];

    
    NSArray *controllers = [NSArray arrayWithObjects:homeNavigation, oneNavigation, twoNavigation, setNavigation, nil];
    self.viewControllers = controllers;
    self.tabBar.tintColor = [UIColor redColor];
    
    self.selectedIndex = 0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
