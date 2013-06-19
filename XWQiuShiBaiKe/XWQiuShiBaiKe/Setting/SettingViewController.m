//
//  SettingViewController.m
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-2.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import "SettingViewController.h"
#import "UIViewController+KNSemiModal.h"
#import "UMWebViewController.h"
#import "DeveloperInfoViewController.h"
#import "AboutViewController.h"

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
    [self initToolBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (is_iPhone5) {
        CGRect rect = self.view.frame;
        rect.size.height = 548;
        self.view.frame = rect;
    }
}

- (void)viewDidUnload
{
    [self setCloseBarButton:nil];
    [self setTitleBarButton:nil];
    [self setSettingToolBar:nil];
    [super viewDidUnload];
}

- (void)dealloc
{
    [_settingTableView release];
    [_modelSwitch release];
    [_closeBarButton release];
    [_titleBarButton release];
    [_settingToolBar release];
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
    settingCell.textLabel.textColor = [UIColor brownColor];
    
    return settingCell;
}

#pragma mark - UITableView delegate method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                break;
            case 1:
                [Dialog alert:@"清除缓存成功"];
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1) {
        DeveloperInfoViewController *vc = [[DeveloperInfoViewController alloc] initWithNibName:@"DeveloperInfoViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
    else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                [UMFeedback showFeedback:self withAppkey:UMENG_APPKEY];
                break;
            case 2:
            {
                AboutViewController *vc = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
                [self.navigationController pushViewController:vc animated:YES];
                [vc release];
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 3) {
        [self showAppRecommendWebView];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private methods

- (void)initToolBar
{
    [_settingToolBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self initTitleView];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [closeButton setImage:[UIImage imageNamed:@"icon_close_large.png"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeSettingViewController) forControlEvents:UIControlEventTouchUpInside];
    _closeBarButton.customView = closeButton;
    [closeButton release];
}

- (void)initTitleView
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"设置";
    _titleBarButton.customView = titleLabel;
    [titleLabel release];
}

- (void)closeSettingViewController
{
    [self dismissSemiModalViewWithCompletion:nil];
}

- (void)showAppRecommendWebView
{
    UMWebViewController *controller = [[UMWebViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forBarMetrics:UIBarMetricsDefault];
    //nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:nav animated:YES completion:nil];
    [nav release];
    [controller release];
}

@end
