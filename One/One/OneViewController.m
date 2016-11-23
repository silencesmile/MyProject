//
//  OneViewController.m
//  One
//
//  Created by youngstar on 16/5/17.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "OneViewController.h"
#import "NSObject+LCY.h"
#import "StarView.h"
#import "One_A_controllerViewController.h"
#import "AlertManager.h"
#import "One_B_ViewController.h"

@interface OneViewController () <UITextFieldDelegate, AlertManagerDelegate>
@property (nonatomic, strong) AlertManager *alert;

@property (nonatomic, strong) UILabel *label;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"One";
     self.view.backgroundColor = [UIColor whiteColor];
     //给navigationBar设置一个空的背景图片即可实现透明，而且标题按钮都在
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"placeImage"]forBarMetrics:UIBarMetricsDefault];
   
    
    // label添加下划线
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(20, 20, 300, 30))];
    label.text = @"给Label添加下划线，表示为可点属性";
    label.textColor = [UIColor blueColor];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:label.text attributes:attribtDic];

    //赋值
    label.attributedText = attribtStr;
    
    [self.view addSubview:label];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:(CGRectMake(20, 60, 300, 30))];
    label2.text = @"给Label添加中划线，表示为打折出售";
    
    //中划线
    NSDictionary *attribtDic2 = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr2 = [[NSMutableAttributedString alloc]initWithString:label2.text attributes:attribtDic2];
    
    // 赋值
    label2.attributedText = attribtStr2;
    
    [self.view addSubview:label2];
    
    
    UITextField *number = [[UITextField alloc]initWithFrame:(CGRectMake(20, 100, 200, 30))];
    number.placeholder = @"只能输入数字和小数点";
    number.keyboardType = UIKeyboardTypeNumberPad;
    number.delegate = self;
    [self.view addSubview:number];
    
    UIButton *button9 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button9.frame = CGRectMake(260, 100, 80, 40);
    button9.backgroundColor = [UIColor lightGrayColor];
    [button9 setTitle:@"Two" forState:(UIControlStateNormal)];
    [button9 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [button9 addTarget:self action:@selector(TwoAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button9];
    
    
   StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(20, 180, 300, 40) numberOfStars:5];
    starView.scorePercent = 0.3;
    starView.allowIncompleteStar = YES;
    starView.hasAnimation = YES;
    [self.view addSubview:starView];
    
    
    
    // button的不规则半角显示
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(20, 250, 80, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"半角" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    CGRect rect = CGRectMake(0, 0, 80, 40);
    CGSize radio = CGSizeMake(5, 5); // 圆角尺寸
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radio];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];
    masklayer.frame = button.bounds;
    masklayer.path = path.CGPath; // 设置路径
    button.layer.mask = masklayer;
    
    [button addTarget:self action:@selector(webView) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(150, 250, 200, 40)];
    _label.text = @"显示Alert的内容";
    [self.view addSubview:_label];
    
    
    // Alert的不规则显示
    UIButton *alertButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton.frame = CGRectMake(20, 320, 80, 40);
    alertButton.backgroundColor = [UIColor lightGrayColor];
    [alertButton setTitle:@"AlertOne" forState:(UIControlStateNormal)];
    [alertButton setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton addTarget:self action:@selector(alertOneAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton];
    
    UIButton *alertButton2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton2.frame = CGRectMake(150, 320, 80, 40);
    alertButton2.backgroundColor = [UIColor lightGrayColor];
    [alertButton2 setTitle:@"AlertTwo" forState:(UIControlStateNormal)];
    [alertButton2 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton2 addTarget:self action:@selector(alertTwoAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton2];
    
    UIButton *alertButton3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton3.frame = CGRectMake(260, 320, 100, 40);
    alertButton3.backgroundColor = [UIColor lightGrayColor];
    [alertButton3 setTitle:@"AlertThree" forState:(UIControlStateNormal)];
    [alertButton3 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton3 addTarget:self action:@selector(alertThreeAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton3];
    
    UIButton *alertButton4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton4.frame = CGRectMake(20, 400, 80, 40);
    alertButton4.backgroundColor = [UIColor lightGrayColor];
    [alertButton4 setTitle:@"AlertFour" forState:(UIControlStateNormal)];
    [alertButton4 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton4 addTarget:self action:@selector(alertFourAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton4];
    
    UIButton *alertButton5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton5.frame = CGRectMake(150, 400, 80, 40);
    alertButton5.backgroundColor = [UIColor lightGrayColor];
    [alertButton5 setTitle:@"AlertFive" forState:(UIControlStateNormal)];
    [alertButton5 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton5 addTarget:self action:@selector(alertFiveAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton5];
    
    UIButton *alertButton6 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton6.frame = CGRectMake(260, 400, 80, 40);
    alertButton6.backgroundColor = [UIColor lightGrayColor];
    [alertButton6 setTitle:@"AlertSix" forState:(UIControlStateNormal)];
    [alertButton6 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton6 addTarget:self action:@selector(alertSixAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton6];
    
    UIButton *alertButton7 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton7.frame = CGRectMake(50, 480, 100, 40);
    alertButton7.backgroundColor = [UIColor lightGrayColor];
    [alertButton7 setTitle:@"AlertSeven" forState:(UIControlStateNormal)];
    [alertButton7 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton7 addTarget:self action:@selector(alertSevenAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton7];
    
    UIButton *alertButton8 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    alertButton8.frame = CGRectMake(200, 480, 100, 40);
    alertButton8.backgroundColor = [UIColor lightGrayColor];
    [alertButton8 setTitle:@"AlertEight" forState:(UIControlStateNormal)];
    [alertButton8 setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [alertButton8 addTarget:self action:@selector(alertEightAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:alertButton8];
    
    
    self.alert = [[AlertManager alloc]init];
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [NSObject isValidAboutInputText:textField shouldChangeCharactersInRange:range replacementString:string decimalNumber:2];
}

- (void)webView
{
    One_A_controllerViewController *one_A = [[One_A_controllerViewController alloc]init];
    one_A.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:one_A animated:YES];
}

- (void)TwoAction
{
    One_B_ViewController *one_B = [[One_B_ViewController alloc]init];
    one_B.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:one_B animated:YES];
}


- (void)alertOneAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertTwoAction
{
    [_alert showSingleActionSheetWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertThreeAction
{
    [_alert showOneAlertWithTitle:@"第三种方式" message:@"Hello World!" tag:1 delegate:self textFieldNumber:1 actionTitle:@"OK" actionStyle:Default alertAction:^(UIAlertAction *action) {
        
        CLog(@"这是第三种方式:");
        
    }];
}


- (void)alertFourAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertFiveAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertSixAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertSevenAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}

- (void)alertEightAction
{
    [_alert showSingleAlertWithTitle:@"OK" message:@"Hello World!" dismissAfterDelay:2.0];
}



- (void)textField:(UITextField *)textField textFieldAtIndex:(NSInteger)index tag:(NSInteger)tag {
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    if (tag == 1) {
        textField.placeholder = @"输入数字1";
    }
    if (tag == 2) {
        switch (index) {
            case 0:
                textField.placeholder = @"字母";
                break;
            case 1:
                textField.placeholder = @"数字";
                break;
            default:
                break;
        }
    }
    if (tag == 3) {
        switch (index) {
            case 0:
                textField.placeholder = @"用户名";
                break;
            case 1:
                textField.placeholder = @"密码";
                break;
            case 2:
                textField.placeholder = @"邮箱";
                break;
            default:
                break;
        }
        
    }
    
}
- (void)action:(UIAlertAction *)action handlerForActionAtIndex:(NSInteger)index tag:(NSInteger)tag {
    
    if (tag == 1) {
          CLog(@"QQQQQ%@", _alert.alertController.textFields[0].text);
    }
    
    if (tag == 3) {
        switch (index) {
            case 0:
                self.label.text = _alert.alertController.textFields[0].text;
                break;
            case 1:
                self.label.text = _alert.alertController.textFields[1].text;
                break;
            case 2:
                self.label.text = _alert.alertController.textFields[2].text;
                break;
            default:
                break;
        }
    }
    if (tag == 4) {
        switch (index) {
            case 0:
                self.view.backgroundColor = [UIColor greenColor];
                break;
            case 1:
                self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
                break;
            case 2:
                self.view.backgroundColor = [UIColor redColor];
                break;
            default:
                break;
        }
    }
}


@end
