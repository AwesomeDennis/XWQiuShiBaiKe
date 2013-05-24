//
//  UIButton+SYExtensions.m
//  SYKit
//
//  Created by Johnny Luo on 12-10-25.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "SYExtensions.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define BUTTON_TitleColor [UIColor colorWithHexString:@"#333333"]
#define BUTTON_TitleShadowColor RGBA(255.0f/255.0f, 255.0f/255.0f, 255.0f/255.0f ,1)
#define BUTTON_TitleHighlightedColor RGBA(222.0f/255.0f, 222.0f/255.0f, 222.0f/255.0f ,1)
#define BUTTON_TitleShadowHighlightedColor RGBA(122.0f/255.0f, 122.0f/255.0f, 122.0f/255.0f ,1)

@implementation UIButton (SYExtensions)

+ (UIButton *)customItem:(CGRect)frame
               setButton:(NSString *)title
                fontSize:(int)size
               addTarget:(id)target
                  action:(SEL)action
             stateNormal:(UIImage *)normalImage
        stateHighlighted:(UIImage *)highlightedImage
{
    UIButton *customItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [customItem setTitle:title forState:UIControlStateNormal];
	[customItem.titleLabel setFont:[UIFont systemFontOfSize:size]];
	[customItem setTitleColor:BUTTON_TitleColor forState:UIControlStateNormal];
    [customItem setTitleShadowColor:BUTTON_TitleShadowColor
                           forState:UIControlStateNormal];
    [customItem.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    [customItem setFrame:frame];
    [customItem addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    [customItem setTitleColor:BUTTON_TitleHighlightedColor forState:UIControlStateHighlighted];
    [customItem setTitleShadowColor:BUTTON_TitleShadowHighlightedColor forState:UIControlStateHighlighted];
    
    customItem.contentEdgeInsets = UIEdgeInsetsMake(0, 9, 0, 0);
    
//    if([UIImage respondsToSelector:@selector(resizableImageWithCapInsets:)])
//    {
//        UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 0);
//        normalImage = [normalImage resizableImageWithCapInsets:insets];
//        highlightedImage = [highlightedImage resizableImageWithCapInsets:insets];
//    }
//    else
//    {
//        normalImage = [normalImage stretchableImageWithLeftCapWidth:10 topCapHeight:0];
//        highlightedImage = [highlightedImage stretchableImageWithLeftCapWidth:10 topCapHeight:0];
//    }
    
    [customItem setBackgroundImage:normalImage forState:UIControlStateNormal];
    [customItem setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    
    return customItem;
}

@end
