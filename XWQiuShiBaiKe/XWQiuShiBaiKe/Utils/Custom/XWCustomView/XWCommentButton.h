//
//  XWCommentButton.h
//  XWQSBK
//
//  Created by renxinwei on 13-5-9.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWCommentButton : UIButton
{
    UILabel *_countLabel;
}

- (void)setCount:(NSInteger)count;

@end
