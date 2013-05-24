//
//  UILabel+SYExtensions.h
//  SYKit
//
//  Created by Eric.Wang on 12-10-10.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SYExtensions)

//make label auto resize heith with content
- (void)setLabelAutoHeightWithContent:(BOOL)autoHeight;

//make label as rounded rect label
- (void)setLabelRoundedRect:(BOOL)roundedRect;

@end
