//
//  XWImagePreviewView.h
//  TestScrollView
//
//  Created by Ren XinWei on 13-5-9.
//  Copyright (c) 2013年 renxinwei's iMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@protocol XWImagePreviewViewDelegate <NSObject>

@optional
- (void)didTapPreviewView;

@end

@interface XWImagePreviewView : UIView <UIScrollViewDelegate, MBProgressHUDDelegate>
{
    MBProgressHUD *_hud;
    UIScrollView *_imageScrollView;
    UIImageView *_previewImageView;
    UIButton *_saveImageButton;
}

@property (nonatomic) CGFloat previewWidth;
@property (nonatomic) CGFloat previewHeight;
@property (nonatomic, assign) id<XWImagePreviewViewDelegate> delegate;

- (void)initImageWithURL:(NSString *)url;
- (void)resetLayoutByPreviewImageView;

@end
