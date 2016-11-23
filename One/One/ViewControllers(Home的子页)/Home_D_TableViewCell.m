//
//  Home_D_TableViewCell.m
//  One
//
//  Created by youngstar on 16/5/30.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "Home_D_TableViewCell.h"

@implementation Home_D_TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    
    return self;
}

- (void)createCell
{
    self.photo = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 10, 100, 80))];
    
    self.name = [[UILabel alloc]initWithFrame:(CGRectMake(150, 20, 150, 30))];
    self.age  = [[UILabel alloc]initWithFrame:(CGRectMake(150, 50, 150, 30))];
    self.sex  = [[UILabel alloc]initWithFrame:(CGRectMake(150, 80, 150, 30))];
    
    self.describe = [[UILabel alloc]initWithFrame:(CGRectMake(20, 100, 355, 50))];
    self.describe.numberOfLines = 0;
    
    
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    [self.contentView addSubview:self.photo];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.age];
    [self.contentView addSubview:self.sex];
    [self.contentView addSubview:self.describe];
    
}

- (void)setModel:(D_Model *)model
{
    self.name.text = [NSString stringWithFormat:@"姓名：%@", model.name];
    self.age.text  = [NSString stringWithFormat:@"年龄：%@", model.age];;
    self.sex.text  = [NSString stringWithFormat:@"性别：%@", model.sex];;
    self.photo.image = [UIImage imageNamed:model.photo];
    
    UIImage *img = [UIImage imageNamed:model.photo];
    NSLog(@"%f,%f",img.size.height,img.size.width); 
    
    
    self.describe.text = model.describe;
    
    CGFloat heigh = [Home_D_TableViewCell hightWithString:model.describe];
    _describe.frame = CGRectMake(20, 100, 355, heigh);
}

// cell的自适应高度
+(CGFloat)hightWithString:(NSString *)string
{   NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(300, 1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return rect.size.height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
