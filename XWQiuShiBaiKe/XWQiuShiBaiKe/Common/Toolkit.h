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
#import "QBUser.h"

typedef enum {
    QiuShiTypeSuggest = 1000,       //随便逛逛-干货
    QiuShiTypeLatest = 1001,        //随便逛逛-嫩草
    QiuShiTypeDay = 2000,           //精华-日
    QiuShiTypeWeek = 2001,          //精华-周
    QiuShiTypeMonth = 2002,         //精华-月
    QiuShiTypeImgrank = 3000,       //有图有真相-硬菜
    QiuShiTypeImages = 3001,        //有图有真相-时令
    QiuShiTypeHistory = 4000        //穿越
}QiuShiType;

@interface Toolkit : NSObject

+ (UIColor *)getAppBackgroundColor;
+ (NSString *)dateStringAfterRandomDay;
+ (QBUser *)getQBUser;

@end
