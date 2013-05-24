//
//  Toolkit.h
//  XWQSBK
//
//  Created by renxinwei on 13-4-30.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "EGORefreshTableHeaderView.h"
#import "LoadMoreFooterView.h"
#import "JSONKit.h"
#import "QiuShiImageViewController.h"
#import "SideBarViewController.h"
#import "QiuShiDetailViewController.h"
#import "XWSliderSwitch.h"
#import "QiuShiCell.h"
#import "QiuShi.h"

typedef enum {
    QiuShiTypeSuggest = 1000,
    QiuShiTypeLatest = 1001,
    QiuShiTypeDay = 2000,
    QiuShiTypeWeek = 2001,
    QiuShiTypeMonth = 2002,
    QiuShiTypeImgrank = 3000,
    QiuShiTypeImages = 3001,
    QiuShiTypeHistory = 4000
}QiuShiType;

@interface Toolkit : NSObject

+ (UIColor *)getAppBackgroundColor;

@end
