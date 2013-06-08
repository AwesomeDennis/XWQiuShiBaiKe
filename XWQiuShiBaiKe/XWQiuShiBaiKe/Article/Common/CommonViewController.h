//
//  CommonViewController.h
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-6-8.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, EGORefreshTableHeaderDelegate, LoadMoreFooterViewDelegate, ASIHTTPRequestDelegate, QiuShiCellDelegate>

- (void)sideButtonDidClicked;
- (void)postButtonDidClicked;

@end
