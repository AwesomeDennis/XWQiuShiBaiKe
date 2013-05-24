//
//  UIScrollView+SYExtensions.m
//  SYKit
//
//  Created by Johnny Luo on 12-10-16.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "UIScrollView+SYExtensions.h"

@implementation UIScrollView (SYExtensions)

- (void)autoresizeContentHeight
{
    [self autoresizeContentHeightWithMarginBottom:0.0f];
}

- (void)autoresizeContentHeightWithMarginBottom:(CGFloat)marginBottom
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.subviews)
    {
        scrollViewHeight = scrollViewHeight > CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) ? scrollViewHeight: CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame);
    }
    [self setContentSize:(CGSizeMake(CGRectGetWidth(self.frame), scrollViewHeight + marginBottom))];
}

- (void)autoresizeContentWidth
{
    CGFloat scrollViewWidth = 0.0f;
    for (UIView* view in self.subviews)
    {
        scrollViewWidth = scrollViewWidth > CGRectGetMinX(view.frame) + CGRectGetWidth(view.frame) ? scrollViewWidth: CGRectGetMinX(view.frame) + CGRectGetWidth(view.frame);
    }
    [self setContentSize:(CGSizeMake(scrollViewWidth, CGRectGetHeight(self.frame)))];
}

@end
