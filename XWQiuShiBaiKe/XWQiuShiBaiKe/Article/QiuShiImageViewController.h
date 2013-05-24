//
//  QiuShiImageViewController.h
//  XWQSBK
//
//  Created by renxinwei on 13-5-10.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWImagePreviewView.h"

@interface QiuShiImageViewController : UIViewController <XWImagePreviewViewDelegate>
{
    XWImagePreviewView *_previewView;
    NSString *_qiushiImageURL;
}

- (void)setQiuShiImageURL:(NSString *)url;

@end
