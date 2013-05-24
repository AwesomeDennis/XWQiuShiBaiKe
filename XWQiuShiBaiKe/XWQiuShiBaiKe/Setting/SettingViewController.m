//
//  SettingViewController.m
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-2.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import "SettingViewController.h"
#import "Toolkit.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"设置";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[Toolkit getAppBackgroundColor]];
}

- (void)dealloc {
    [_settingTableView release];
    [_modelSwitch release];
    [super dealloc];
}

#pragma mark - UItableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 2;
            break;
        case 1:
            rows = 1;
            break;
        case 2:
            rows = 3;
            break;
        case 3:
            rows = 1;
            break;
        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SETTINGCELL";
    UITableViewCell *settingCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!settingCell) {
        settingCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        settingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *settingTitle = @"";
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    settingTitle = @"夜间模式";
                    settingCell.accessoryView = _modelSwitch;
                    settingCell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                    break;
                case 1:
                    settingTitle = @"清除缓存";
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    settingTitle = @"我的资料";
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    settingTitle = @"意见反馈";
                    break;
                case 1:
                    settingTitle = @"打分支持糗百";
                    break;
                case 2:
                    settingTitle = @"关于糗百";
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    settingTitle = @"升级至有广告版";
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    settingCell.textLabel.text = settingTitle;
    settingCell.textLabel.font = [UIFont systemFontOfSize:15];
    settingCell.textLabel.textColor = [UIColor darkGrayColor];
    
    return settingCell;
}

#pragma mark - UITableView delegate method

@end
