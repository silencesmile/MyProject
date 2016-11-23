//
//  Home_D_TableViewCell.h
//  One
//
//  Created by youngstar on 16/5/30.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D_Model.h"

@interface Home_D_TableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *age;
@property (nonatomic, strong) UILabel *sex;
@property (nonatomic, strong) UIImageView *photo;
@property (nonatomic, strong) UILabel *describe;

@property (nonatomic, strong) D_Model *model;

+(CGFloat)hightWithString:(NSString *)string;
@end
