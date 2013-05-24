//
//  UIView+SYExtensions.h
//  SYKit
//
//  Created by Johnny Luo on 12-10-11.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYExtensions)

- (void)centerInRect:(CGRect)rect;
- (void)centerVerticallyInRect:(CGRect)rect;
- (void)centerHorizontallyInRect:(CGRect)rect;

- (void)centerInSuperView;
- (void)centerVerticallyInSuperView;
- (void)centerHorizontallyInSuperView;

//- (void)centerHorizontallyBelow:(UIView *)view padding:(CGFloat)padding;
//- (void)centerHorizontallyBelow:(UIView *)view;

- (void)drawInnerShadowInRect:(CGRect)rect fillColor:(UIColor *)fillColor;
- (void)drawInnerShadowInRect:(CGRect)rect radius:(CGFloat)radius fillColor:(UIColor *)fillColor;
- (void)drawInnerShadowInRect:(CGRect)rect radius:(CGFloat)radius fillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowBlur:(CGFloat)blur;

- (CGFloat)getViewFillHeight;
- (void)autoresizeViewHeight;
- (void)autoresizeViewHeightWithMarginBottom:(CGFloat)marginBottom;
- (void)autoresizeViewHeightWithMarginBottom:(CGFloat)marginBottom without:(Class)class;

- (void)addSubviewFollowBottom:(UIView *)subview;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end
