//
//  Toolkit.m
//  XWQSBK
//
//  Created by renxinwei on 13-4-30.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import "Toolkit.h"

@implementation Toolkit

+ (UIColor *)getAppBackgroundColor
{
    UIImage *image = [UIImage imageNamed:@"main_background.png"];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:image];
    return backgroundColor;
}
@end
