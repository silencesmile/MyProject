//
//  One_B_ViewController.m
//  One
//
//  Created by youngstar on 16/6/8.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "One_B_ViewController.h"
#import "BearCutOutView.h"
#import "BearConstants.h"
#import "UIView+BearSet.h"

@interface One_B_ViewController ()

@end

@implementation One_B_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor purpleColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view.layer addSublayer:gradientLayer];
    
    
    //  cutOutView_1
    
    BearCutOutView *cutOutView_1 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [cutOutView_1 setUnCutColor:[UIColor yellowColor] cutOutFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:cutOutView_1];
    
    
    //  cutOutView_2
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(50, 50)];
    [bezierPath addLineToPoint:CGPointMake(150, 120)];
    [bezierPath addLineToPoint:CGPointMake(60, 180)];
    [bezierPath closePath];
    
    BearCutOutView *cutOutView_2 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, cutOutView_1.maxY + 50, 200, 200)];
    [cutOutView_2 setUnCutColor:[UIColor purpleColor] cutOutPath:bezierPath];
    [self.view addSubview:cutOutView_2];
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
