//
//  ShareOptionView.h
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-8.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareOptionView;

@protocol ShareOptionViewDelegate <NSObject>

@optional
- (void)shareOptionView:(ShareOptionView *)shareView didClickButtonAtIndex:(NSInteger)index;

@end

@interface ShareOptionView : UIView

@property (retain, nonatomic) UIImageView *backgroundImageView;
@property (assign, nonatomic) id<ShareOptionViewDelegate> delegate;

- (void)fadeIn;
- (void)fadeOut;

@end
