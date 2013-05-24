//
//  UILabel+SYExtensions.m
//  SYKit
//
//  Created by Eric.Wang on 12-10-10.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "UILabel+SYExtensions.h"
#import <QuartzCore/QuartzCore.h>

#define kCornerRadius 8

@implementation UILabel (SYExtensions)

#pragma mark -
#pragma mark - auto height
- (void)setLabelAutoHeightWithContent:(BOOL)autoHeight
{
    if (autoHeight) {
        [self adjustHeightOfLabel];
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    else
    {
        [self removeObserver:self forKeyPath:@"text" context:nil];
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self adjustHeightOfLabel];
}

- (void)adjustHeightOfLabel
{
    //calculate the expected label size with content
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width,MAXFLOAT);
    CGSize expectedLabelSize = [self.text sizeWithFont:self.font
                                     constrainedToSize:maximumLabelSize
                                         lineBreakMode:NSLineBreakByWordWrapping];
    //reset label size
    CGRect frame = self.frame;
    frame.size.height = expectedLabelSize.height;
    [self setFrame:frame];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    [self setNumberOfLines:0];
}

#pragma mark -
#pragma mark - rounded rect label 

- (void)setLabelRoundedRect:(BOOL)roundedRect
{
    self.layer.cornerRadius = kCornerRadius;
}

@end
