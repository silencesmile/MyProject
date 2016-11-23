//
//  BseViewController.h
//  One
//
//  Created by youngstar on 16/5/17.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BseViewController : UIViewController
@property (nonatomic , assign) float w;
@property (nonatomic , assign) float h;

- (void)setNavTitle:(NSString *)title;

- (void)setNavRightButtonwithImg:(NSString *)normalImg selImg:(NSString *)selImg title:(NSString *)title action:(SEL)action;
- (void)setNavLeftButtonwithImg:(NSString *)normalImg selImg:(NSString *)selImg title:(NSString *)title action:(SEL)action;
- (void)setNavRightButtonEnable:(BOOL)enable;
- (void)setNavLeftButtonEnable:(BOOL)enable;
- (void)setNavBackArrow;
- (void)navGoHomeButtonClicked:(UIButton *)sender;
- (void)navBackButtonClicked:(UIButton *)sender;

//progress event
- (void)showProgressViewWithTitle:(NSString *)title;
- (void)hideProgressView;
- (void)hideProgressView:(BOOL)animation;
- (void)switchOfGR:(BOOL)flag;

- (void)showNoDataView:(NSString *)title;

- (void)hideNoDataView;


//nav下面的黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;
- (NSAttributedString *)converHtml:(NSString *)htmlStr;
- (BOOL)isNetOK;

@end
