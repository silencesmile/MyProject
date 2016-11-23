//
//  ViewController.m
//  One
//
//  Created by youngstar on 16/5/17.
//  Copyright © 2016年 杨铭星. All rights reserved.
//
#define NUMBERS @"0123456789"

#import "ViewController.h"
#import "Home_D_Controller.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *One;
@property (nonatomic, strong) UITextField *Two;
@property (nonatomic, strong) UIButton *ThreeBT;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(20, 180, 350, 30))];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.text = @"修改textField的placeholder的字体颜色、大小";
    [self.view addSubview:label];
    
    // 修改textField的placeholder的字体颜色、大小
    self.One = [[UITextField alloc]initWithFrame:(CGRectMake(20, 200, 350, 30))];
    _One.placeholder = @"Copyright © 2016年 墨镜熊猫. All rights reserved.";
    [_One setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_One setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    _One.secureTextEntry = YES;
    _One.delegate = self;
    [self.view addSubview:_One];
    
    // 修改textField的placeholder的字体颜色、大小
    self.Two = [[UITextField alloc]initWithFrame:(CGRectMake(20, 100, 350, 30))];
    _Two.placeholder = @"只允许输入数字";
    _Two.backgroundColor = [UIColor lightGrayColor];
    [_Two setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_Two setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    _Two.secureTextEntry = NO;
    _Two.keyboardType = UIKeyboardTypeNumberPad;
    _Two.delegate = self;
    _Two.tag = 101;
    [self.view addSubview:_Two];
    
    
    UILabel *labelStr = [[UILabel alloc]initWithFrame:(CGRectMake(30, 130, 300, 30))];
    labelStr.text = @"iOS 在UILabel显示不同的字体和颜色";
    labelStr.textColor = [UIColor lightGrayColor];
    labelStr.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:labelStr];
    
    NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"AAA:%@", labelStr.text]];
    // 设置指定区域字体颜色
    [newStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 4)];
    // 设置指定区域字体样式和大小
    [newStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:12] range:NSMakeRange(0, 4)];
    labelStr.attributedText = newStr;
    
    
    
    // 修改按钮的图片 和 文字的位置
        self.ThreeBT = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _ThreeBT.frame = CGRectMake(20, 30, 80, 30);
        _ThreeBT.backgroundColor = [UIColor lightGrayColor];
        [_ThreeBT setImage:[UIImage imageNamed:@"monkey"] forState:(UIControlStateNormal)];
        [_ThreeBT setTitle:@"弹幕" forState:(UIControlStateNormal)];

        _ThreeBT.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 50); // 上左下右
        _ThreeBT.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        _ThreeBT.titleLabel.textAlignment = 0;
        [_ThreeBT setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [_ThreeBT addTarget:self action:@selector(pushController:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_ThreeBT];
    
    
    // 修改按钮的图片 和 文字的位置
    UIButton *FourBT = [UIButton buttonWithType:(UIButtonTypeCustom)];
    FourBT.frame = CGRectMake(120, 30, 240, 30);
    FourBT.titleLabel.font = [UIFont systemFontOfSize:15];
    FourBT.backgroundColor = [UIColor lightGrayColor];
    
    [FourBT setTitle:@"唯一标识符和密码自动填充功能" forState:(UIControlStateNormal)];
    [FourBT setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [FourBT addTarget:self action:@selector(push_Home_B_Controller:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:FourBT];
    
    // 修改按钮的图片 和 文字的位置
    UIButton *FiveBT = [UIButton buttonWithType:(UIButtonTypeCustom)];
    FiveBT.frame = CGRectMake(60, 430, 240, 30);
    FiveBT.titleLabel.font = [UIFont systemFontOfSize:15];
    FiveBT.backgroundColor = [UIColor lightGrayColor];
    
    [FiveBT setTitle:@"多图下载" forState:(UIControlStateNormal)];
    [FiveBT setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [FiveBT addTarget:self action:@selector(push_Home_C_Controller:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:FiveBT];
    
    
    // Cell的大小自适应
    UIButton *SixBT = [UIButton buttonWithType:(UIButtonTypeCustom)];
    SixBT.frame = CGRectMake(60, 500, 240, 30);
    SixBT.titleLabel.font = [UIFont systemFontOfSize:15];
    SixBT.backgroundColor = [UIColor lightGrayColor];
    
    [SixBT setTitle:@"Cell的大小自适应" forState:(UIControlStateNormal)];
    [SixBT setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [SixBT addTarget:self action:@selector(push_Home_D_Controller:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:SixBT];
    
    
    // 点击空白处回收键盘
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:(CGRectMake(20, 250, 300, 150))];
    imageView.image = [UIImage imageNamed:@"One"];
    [self.view addSubview:imageView];
    
    
    CGPoint point1 = CGPointMake(20, 40);
    CGPoint point2 = CGPointMake(20, 30);
    
    // 两点之间的距离
    CGFloat distance = [self DistanceBetweenPoint1:point1 and:point2];
    CLog(@"%f", distance);
    
    CLog(@"One,One,One,One");
}

- (void)pushController:(UIButton *)button
{
    Home_A_ViewController *home_A = [[Home_A_ViewController alloc]init];
    home_A.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:home_A animated:YES];
}

- (void)push_Home_B_Controller:(UIButton *)button
{
    Home_B_ViewController *home_B = [[Home_B_ViewController alloc]init];
    home_B.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:home_B animated:YES];
}

- (void)push_Home_C_Controller:(UIButton *)button
{
    Home_C_Controller *home_C = [[Home_C_Controller alloc]init];
    home_C.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:home_C animated:YES];
}

- (void)push_Home_D_Controller:(UIButton *)button
{
    Home_D_Controller *home_D = [[Home_D_Controller alloc]init];
    home_D.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:home_D animated:YES];
}



// 求两点之间的距离
- (float) DistanceBetweenPoint1:(CGPoint )point1 and:(CGPoint )point2
{
    CGFloat dx = point2.x - point1.x;
    CGFloat dy = point2.y - point1.y;
    
    return sqrt(dx * dx + dy * dy);
}

// 点击return 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

// 键盘回收
- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [_One resignFirstResponder];
    [_Two resignFirstResponder];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 101)
    {
        NSCharacterSet*cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString: NUMBERS] invertedSet];
        NSString*filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest) {
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入数字"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            
            [alert show];
            return NO;
            
        }
    }
    else
    {
        
    }
    
  
    return YES;
}


@end
