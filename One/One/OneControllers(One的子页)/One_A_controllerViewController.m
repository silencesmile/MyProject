//
//  One_A_controllerViewController.m
//  One
//
//  Created by youngstar on 16/6/3.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "One_A_controllerViewController.h"
#import "RAShareChartView.h"

@interface One_A_controllerViewController ()

@property (nonatomic, strong) RAShareChartView *chartV;
@end

@implementation One_A_controllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"One_A";
    
    // 给UIView设置图片
    UIView *view = [[UIView alloc]initWithFrame:(CGRectMake(10, 20, 350, 200))];
    UIImage *image = [UIImage imageNamed:@"placeImage"];
    view.layer.contents = (__bridge id)image.CGImage;
    //同样可以设置显示的图片范围
    //不过此处略有不同，这里的四个值均为0-1之间；对应的依然是写x,y,widt,height
    view.layer.contentsCenter = CGRectMake(0, 0, 0, 0);
    
    [self.view addSubview:view];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(20, 20, 350, 30))];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textColor = [UIColor redColor];
    label.text = @"修改textField的placeholder的字体颜色、大小";
    [view addSubview:label];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartV.center = CGPointMake(200, 450);
    [self.view addSubview:self.chartV];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"技术",@"力量",@"速度",@"耐力",@"进步", nil];
    [self.chartV drawBgPentagon:titleArray];
    
    // 各部分所占比重 最高位4
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@(1.5), @(2), @(4.0), @(3.5), @(2.3), nil];
    
    self.chartV.scoresArray = array;
}

-(RAShareChartView *)chartV
{
    if (!_chartV) {
        _chartV = [[RAShareChartView alloc] init];
        _chartV.bounds = CGRectMake(0, 0, 590 / 2.0, 462 / 2.0);
    }
    return _chartV;
}

@end
