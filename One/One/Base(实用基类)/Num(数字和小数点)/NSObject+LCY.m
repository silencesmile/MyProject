//
//  NSObject+LCY.m
//  TogetherInvest
//
//  Created by 雷传营 on 16/6/1.
//  Copyright © 2016年 Zhong Tou. All rights reserved.
//

#import "NSObject+LCY.h"

@implementation NSObject (LCY)
+(BOOL)isValidAboutInputText:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string decimalNumber:(NSInteger)number{
    
    NSScanner      *scanner    = [NSScanner scannerWithString:string];
    NSCharacterSet *numbers;
    NSRange         pointRange = [textField.text rangeOfString:@"."];
    if ( (pointRange.length > 0) && (pointRange.location < range.location  || pointRange.location > range.location + range.length) ){
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    }else{
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    }
    if ( [textField.text isEqualToString:@""] && [string isEqualToString:@"."] ){
        return NO;
    }
    short remain = number; //默认保留2位小数
    NSString *tempStr = [textField.text stringByAppendingString:string];
    NSUInteger strlen = [tempStr length];
    if(pointRange.length > 0 && pointRange.location > 0){ //判断输入框内是否含有“.”。
        if([string isEqualToString:@"."]){ //当输入框内已经含有“.”时，如果再输入“.”则被视为无效。
            return NO;
        }
        if(strlen > 0 && (strlen - pointRange.location) > remain+1){ //当输入框内已经含有“.”，当字符串长度减去小数点前面的字符串长度大于需要要保留的小数点位数，则视当次输入无效。
            return NO;
        }
    }
    NSRange zeroRange = [textField.text rangeOfString:@"0"];
    if(zeroRange.length == 1 && zeroRange.location == 0){ //判断输入框第一个字符是否为“0”
        if(![string isEqualToString:@"0"] && ![string isEqualToString:@"."] && [textField.text length] == 1){ //当输入框只有一个字符并且字符为“0”时，再输入不为“0”或者“.”的字符时，则将此输入替换输入框的这唯一字符。
            textField.text = string;
            return NO;
        }else{
            if(pointRange.length == 0 && pointRange.location > 0){ //当输入框第一个字符为“0”时，并且没有“.”字符时，如果当此输入的字符为“0”，则视当此输入无效。
                if([string isEqualToString:@"0"]){
                    return NO;
                }
            }
        }
    }
    NSString *buffer;
    if ( ![scanner scanCharactersFromSet:numbers intoString:&buffer] && ([string length] != 0) ){
        return NO;
    }else{
        return YES;
    }
}

@end
