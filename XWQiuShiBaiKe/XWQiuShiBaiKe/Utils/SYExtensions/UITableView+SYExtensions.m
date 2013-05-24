//
//  UITableView+SYExtensions.m
//  SYKit
//
//  Created by Johnny Luo on 12-11-16.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "UITableView+SYExtensions.h"

@implementation UITableView (SYExtensions)

- (void)setExtraCellLineHidden
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
    [view release];
}

@end
