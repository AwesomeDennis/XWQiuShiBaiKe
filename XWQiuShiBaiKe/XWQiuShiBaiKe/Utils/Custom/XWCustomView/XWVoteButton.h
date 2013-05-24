//
//  XWVoteButton.h
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-9.
//  Copyright (c) 2013年 renxinwei's iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWVoteButton : UIButton
{
    UIButton *_faceButton;
    UILabel *_countLabel;
}

- (void)setFaceButtonImage:(UIImage *)nImage andSelectedImage:(UIImage *)sImage;
- (void)setStateSelected:(BOOL)selected;
- (void)setCount:(NSInteger)count;

@end
