//
//  D_Model.m
//  One
//
//  Created by youngstar on 16/5/30.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "D_Model.h"

@implementation D_Model

- (id)initWithName:(NSString *)name age:(NSString *)age sex:(NSString *)sex photo:(NSString *)photo describe:(NSString *)describe
{
    self = [ super init];
    if (self) {
        self.name = name;
        self.age = age;
        self.sex = sex;
        self.photo = photo;
        self.describe = describe;
    }
    return self;
}
@end
