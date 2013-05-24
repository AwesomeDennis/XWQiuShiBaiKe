//
//  XWZoomInView.h
//  iOSAppTest
//
//  Created by renxinwei on 13-5-5.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWZoomInPlusView : UIScrollView <UIScrollViewDelegate>
{
    UILabel *_labelPlus;
}

- (void)zoomInPlusTextInPoint:(CGPoint)point;

@end
