//
//  UIColor+SYExtensions.h
//  SYKit
//
//  Created by Johnny Luo on 12-10-10.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SYExtensions)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
