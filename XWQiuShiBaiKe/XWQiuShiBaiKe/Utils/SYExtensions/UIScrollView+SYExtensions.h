//
//  UIScrollView+SYExtensions.h
//  SYKit
//
//  Created by Johnny Luo on 12-10-16.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (SYExtensions)

- (void)autoresizeContentHeight;
- (void)autoresizeContentHeightWithMarginBottom:(CGFloat)marginBottom;
- (void)autoresizeContentWidth;

@end
