//
//  LCYUITextField.m
//  TogetherInvest
//
//  Created by 雷传营 on 16/6/1.
//  Copyright © 2016年 Zhong Tou. All rights reserved.
//

#import "LCYUITextField.h"

@implementation LCYUITextField

//禁止复制粘贴
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
        return NO;
    if (action == @selector(select:))
        return NO;
    if (action == @selector(selectAll:))
        return NO;
    return [super canPerformAction:action withSender:sender];
}
@end
