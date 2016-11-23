//
//  StarView.h
//  One
//
//  Created by youngstar on 16/6/2.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StarView;
@protocol StarViewDelegate <NSObject>
@optional
// 星星百分比(得分值)发生变化的代理
- (void)starView:(StarView *)starView scorePercentDidChange:(CGFloat)newScorePercent;

@end


@interface StarView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0~1，默认1
@property (nonatomic, assign) BOOL hasAnimation; // 是否允许动画 默认是NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO

@property (nonatomic, weak) id<StarViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@end
