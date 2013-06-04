//
//  XWPlaceHolderTextView.h
//  XWQiuShiBaiKe
//
//  Created by Ren XinWei on 13-6-4.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeHolder;
@property (nonatomic, retain) UIColor *placeHolderColor;
@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) UIImage *placeHodlerBackgroundImage;

- (void)textChanged:(NSNotification *)notification;

@end
