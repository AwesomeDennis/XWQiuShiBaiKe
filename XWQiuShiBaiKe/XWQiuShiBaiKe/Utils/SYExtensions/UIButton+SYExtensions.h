//
//  UIButton+SYExtensions.h
//  SYKit
//
//  Created by Johnny Luo on 12-10-25.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SYExtensions)

+ (UIButton *)customItem:(CGRect)frame setButton:(NSString *)title fontSize:(int)size addTarget:(id)target action:(SEL)action stateNormal:(UIImage *)normalImage stateHighlighted:(UIImage *)highlightedImage;

@end
