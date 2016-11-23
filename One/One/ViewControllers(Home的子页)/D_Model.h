//
//  D_Model.h
//  One
//
//  Created by youngstar on 16/5/30.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D_Model : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *describe;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *name;

- (id)initWithName:(NSString *)name age:(NSString *)age sex:(NSString *)sex photo:(NSString *)photo describe:(NSString *)describe;

@end
