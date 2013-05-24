//
//  XWFavoriteButton.h
//  XWQSBK
//
//  Created by renxinwei on 13-5-9.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWFavoriteButton : UIButton
{
    UIButton *_favoriteButton;
}

- (void)setFavoriteButtonImage:(UIImage *)nImage andSelectedImage:(UIImage *)sImage;
- (void)setStateSelected:(BOOL)selected;

@end
