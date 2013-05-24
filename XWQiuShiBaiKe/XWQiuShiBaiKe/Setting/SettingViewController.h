//
//  SettingViewController.h
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-2.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UISwitch *modelSwitch;
@property (retain, nonatomic) IBOutlet UITableView *settingTableView;

@end
