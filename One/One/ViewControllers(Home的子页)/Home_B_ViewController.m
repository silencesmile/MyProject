//
//  Home_B_ViewController.m
//  One
//
//  Created by youngstar on 16/5/18.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "Home_B_ViewController.h"
#import "SSKeychain.h"

static NSString *kKeychainService = @"YoungStar.One.keychaindemo";
static NSString *kKeychainDeviceId    = @"KeychainDeviceId";

@interface Home_B_ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *UUID_Label;
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation Home_B_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBackArrow];
    
    self.title = @"唯一标识符和密码自动填充功能";
    
    self.accountText.delegate = self;
    self.passwordText.delegate = self;
    self.UUID_Label.text = [NSString stringWithFormat:@"设备标识为：%@", [self getDeviceId]];
    
    
    // 点击空白处回收键盘
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.accountText) {
        self.accountText.text = nil;
        self.passwordText.text = nil;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.accountText) {
        [self.passwordText becomeFirstResponder];
    }
    else if (textField == self.passwordText) {
        [self loginAction:nil];
    }
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.accountText) {
        // 提取本地密码
        NSString *localPassword = [SSKeychain passwordForService:kKeychainService account:textField.text];
        if (localPassword) {
            self.passwordText.text = localPassword;
        }
    }
}

- (IBAction)loginAction:(id)sender {
    if(!self.accountText.text || !self.passwordText.text)
    {
        [MBProgressHUD showError:@"请输入账号和密码" toView:self.view];
        return;
    }
    
    NSString *info = [NSString stringWithFormat:@"账户名:%@\n密码:%@", self.accountText.text, self.passwordText.text];
    
    // 保存账号 密码
    [SSKeychain setPassword:self.passwordText.text forService:kKeychainService account:self.accountText.text];
    
    [MBProgressHUD showSuccess:info toView:self.view];
    // 清空 并回收键盘
    _passwordText.text = nil;
    _accountText.text = nil;
    [self handleSingleTap:nil];
    
   
    
}
- (IBAction)deleteAction:(id)sender {
    if (!self.accountText.text ) {
        return;
    }
    
    
    if ([SSKeychain deletePasswordForService:kKeychainService account:self.accountText.text]) {
       NSString *account = [NSString stringWithFormat:@"账户%@的密码已清空!", self.accountText.text];
        [MBProgressHUD showSuccess:account toView:self.view];
        self.passwordText.text = nil;
    }
    else
    {
        [MBProgressHUD showError:@"删除失败了" toView:self.view];
    }
    
}

- (IBAction)deleteAllAccounts:(id)sender {
    if (!self.accountText.text ) {
        return;
    }
    
    NSArray *accounts = [SSKeychain accountsForService:kKeychainService];
    if (accounts.count > 0) {
        for (NSDictionary *dic in accounts) {
            NSString *name = [dic objectForKey:@"acct"];
            CLog(@"name = %@", name);
            if(![name isEqualToString:@"KeychainDeviceId"])
            {
            if ([SSKeychain deletePasswordForService:kKeychainService account:name]) {
                NSString *account = [NSString stringWithFormat:@"账户%@的密码已清空!", name];
                [MBProgressHUD showSuccess:account toView:self.view];
                self.passwordText.text = nil;
                self.accountText.text = nil;
            }
            else
            {
                [MBProgressHUD showError:@"删除失败了" toView:self.view];
            }
            }
        }
    }
    
}

- (IBAction)showAccountAction:(id)sender {
    NSArray *accounts = [SSKeychain accountsForService:kKeychainService];
    NSLog(@"accounts:\n%@", accounts);
     [MBProgressHUD showSuccess:@"看下控制台输出" toView:self.view];
}


#pragma mark - private method
- (NSString *)getDeviceId {
    // 读取设备号
    NSString *localDeviceId = [SSKeychain passwordForService:kKeychainService account:kKeychainDeviceId];
    if (!localDeviceId) {
        // 保存设备号
        CFUUIDRef deviceId = CFUUIDCreate(NULL);
        assert(deviceId != NULL);
        CFStringRef deviceIdStr = CFUUIDCreateString(NULL, deviceId);
        [SSKeychain setPassword:[NSString stringWithFormat:@"%@", deviceIdStr] forService:kKeychainService account:kKeychainDeviceId];
        localDeviceId = [NSString stringWithFormat:@"%@", deviceIdStr];
    }
    return localDeviceId;
}

//- (void)showMsg:(NSString *)msg {
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tip" message:msg preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:cancel];
//    [self showViewController:alert sender:nil];
//}


// 键盘回收
- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [_accountText resignFirstResponder];
    [_passwordText resignFirstResponder];
}

@end
