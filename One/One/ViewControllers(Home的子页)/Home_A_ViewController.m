//
//  Home_A_ViewController.m
//  One
//
//  Created by youngstar on 16/5/18.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "Home_A_ViewController.h"

@interface Home_A_ViewController ()<UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *One;

@property (nonatomic, strong) UIView *Contentview;
@property(nonatomic, retain) UITextView * contentTextView;

//判断是否买了会员
@property (nonatomic, assign) BOOL isVip;
@end

@implementation Home_A_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home_A_Controller";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    [self setNavBackArrow];
    
    // 修改textField的placeholder的字体颜色、大小
    self.One = [[UITextField alloc]initWithFrame:(CGRectMake(20, 200, 350, 30))];
    _One.placeholder = @"Copyright © 2016年 杨铭星. 弹幕内容";
    [_One setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_One setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    _One.delegate = self;
    [self.view addSubview:_One];
    
    UIButton *VIPbutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    VIPbutton.frame = CGRectMake(20, 400, 100, 30);
    [VIPbutton setTitle:@"买会员" forState:(UIControlStateNormal)];
    [VIPbutton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [VIPbutton addTarget:self action:@selector(VIPButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:VIPbutton];
    
    
    // 评论时的可自适应输入文字的大小
    [self twoAction];
    
}

- (void)twoAction
{
    self.Contentview = [[UIView alloc]initWithFrame:CGRectMake(16, 500, 350, 40)];
    _Contentview.backgroundColor = [UIColor colorWithHexString:@"#A4A4A4"];
    _Contentview.layer.cornerRadius = 10.0f;
    [self.view addSubview:_Contentview];
    
    _contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 350, 40)];
    _contentTextView.text = @"您可在此评论";
    _contentTextView.textColor =[UIColor colorWithHexString:@"#A4A4A4"];
    _contentTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _contentTextView.layer.borderWidth = 2;
    _contentTextView.layer.cornerRadius = 10.0f;
    
    [_contentTextView.layer setMasksToBounds:YES];
    _contentTextView.returnKeyType = UIReturnKeyDefault;
    _contentTextView.delegate = self;
    [_Contentview addSubview:_contentTextView];
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    _contentTextView.text = @"";
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        _contentTextView.text = @"您可在此评论!";
    }
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    
    /** 判断是否是Vip */
    //根据是否是Vip来设置label的背景色
    if(self.isVip)
    {
        label.textColor = [UIColor redColor];
    }
    else
    {
        label.textColor = [UIColor blueColor];
    }
    
    label.text = self.One.text;
    
    // 每次点击return后清空输入框
    self.One.text = nil;
    
    // 设置label自适应文字大小
    label.adjustsFontSizeToFitWidth = YES;
    
    CGFloat w = kMainBoundsWidth;
    CGFloat h = 30;
    CGFloat x = kMainBoundsWidth;
    
    // 随机产生y的值，来随机产生label的高度
    
    CGFloat y = arc4random_uniform(kMainScreenHeight - h);
    label.frame = CGRectMake(x, y, w, h);
    
    // 执行动画
    [UIView animateWithDuration:10.0 animations:^{
        label.frame = CGRectMake(-w, y, w, h);
    }];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)VIPButtonAction:(UIButton *)button
{
    if (self.isVip) {
        self.isVip = NO;
        
        [button setTitle:@"买会员" forState:(UIControlStateNormal)];
        
    }
    else
    {
        self.isVip = YES;
        
        [button setTitle:@"去会员" forState:(UIControlStateNormal)];
    }
}

- (void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    _Contentview.frame = CGRectMake(16, kMainBoundsHeight-118, 350, 40);
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    CGRect frame = _Contentview.frame;
    [self.view bringSubviewToFront:_Contentview];
    frame.origin.y = frame.origin.y-height;
    _Contentview.frame = frame;
}

//UITextView 输入文本时实时计算文字的高度
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    CGRect frame = textView.frame;
    float height = [self heightForTextView:textView WithText:textView.text];
    if (height>80){
    }else{
        frame.size.height = height;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect ContentviewFrame = _Contentview.frame;
            ContentviewFrame.origin.y = ContentviewFrame.origin.y-(height+24-ContentviewFrame.size.height);
            ContentviewFrame.size.height = height+24;
            _Contentview.frame = ContentviewFrame;
            textView.frame = frame;
        } completion:nil];
        
    }
    return YES;
}

//计算评论框文字的高度
- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
    float fPadding = 10.0;
    CGSize constraint = CGSizeMake(textView.contentSize.width - fPadding, CGFLOAT_MAX);
    CGSize size = [strText sizeWithFont:textView.font constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    float fHeight = size.height + 25.0;
    return fHeight;
}


//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification{
    CGRect frame = CGRectMake(0, kMainBoundsHeight-118, kMainBoundsWidth, 40);
    [UIView animateWithDuration:0.5 animations:^{
        _Contentview.frame = frame;
        if (kIsIphone6P || kIsIphone6) {
            _contentTextView.frame = CGRectMake(16, 9.5, 350, 40);
        }
        else{
            _contentTextView.frame = CGRectMake(16, 9.5, 350, 40);
            
        }
    } completion:nil];
    
}

@end
