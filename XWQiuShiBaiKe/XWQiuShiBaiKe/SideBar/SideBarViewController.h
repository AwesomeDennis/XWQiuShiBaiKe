//
//  SideBarViewController.h
//  XWQSBK
//
//  Created by Ren XinWei on 13-4-28.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideBarSelectedDelegate.h"

@interface SideBarViewController : UIViewController <SideBarSelectedDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//@property (nonatomic) BOOL sideBarShowing;
@property (retain, nonatomic) IBOutlet UIView *contentView;
@property (retain, nonatomic) IBOutlet UIView *navBackView;

+ (id)share;
+ (BOOL)getShowingState;

@end
