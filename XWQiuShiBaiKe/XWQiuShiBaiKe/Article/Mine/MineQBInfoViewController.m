//
//  MineQBInfoViewController.m
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-6-1.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import "MineQBInfoViewController.h"
#import "UIViewController+KNSemiModal.h"
#import "UIButton+WebCache.h"

@interface MineQBInfoViewController ()

@end

@implementation MineQBInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[Toolkit getAppBackgroundColor]];
    [self initToolBar];
    [self initButton:_mineLogOutButton withNormalImageName:@"row_sina_bg.png" andHighlightImageName:nil];
    [self initMineHeaderView];
}

- (void)dealloc
{
    [_mineInfoHeaderView release];
    [_mineNameLabel release];
    [_mineAuthButton release];
    [_mineFaceButton release];
    [_mineInfoTableView release];
    [_closeBarButton release];
    [_titleBarButton release];
    [_mineInfoToolBar release];
    [_mineInfoFooterView release];
    [_mineLogOutButton release];
    [_qqShareCell release];
    [_sinaShareCell release];
    [_renrenShareCell release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setMineInfoHeaderView:nil];
    [self setMineNameLabel:nil];
    [self setMineAuthButton:nil];
    [self setMineFaceButton:nil];
    [self setMineInfoTableView:nil];
    [self setCloseBarButton:nil];
    [self setTitleBarButton:nil];
    [self setMineInfoToolBar:nil];
    [self setMineInfoFooterView:nil];
    [self setMineLogOutButton:nil];
    [self setQqShareCell:nil];
    [self setSinaShareCell:nil];
    [self setRenrenShareCell:nil];
    [super viewDidUnload];
}

#pragma mark - UIAciton methods

- (IBAction)authButtonClicked:(id)sender {
}

- (IBAction)faceButtonClicked:(id)sender
{
    NSLog(@"face button clicked");
}

- (IBAction)logoutButtonClicked:(id)sender
{
    [_delegate QBUserDidLogOutSuccess];
    [self dismissSemiModalView];
}

#pragma mark - UITableView DataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = 0;
    if (section == 0) rowCount = 0;
    else if (section == 1) rowCount = 3;
    else if (section == 2) rowCount = 0;
    
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"InfoCellIdentifier";
    UITableViewCell *cell = nil;
    if (!cell) {
        if (indexPath.row == 0) {
            cell = _qqShareCell;
        }
        else if (indexPath.row == 1) {
            cell = _sinaShareCell;
        }
        else if (indexPath.row == 2) {
            cell = _renrenShareCell;
        }
        else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    if (section == 1) {
        title = @"分享绑定";
    }
    
    return title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *title = nil;
    if (section == 1) {
        title = @"分享绑定仅用于分享糗事到各个社交网站";
    }
    
    return title;
}

#pragma mark - UITableView delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0;
    if (section == 0) {
        height = 87;
    }
    else if (section == 1) {
        height = 20;
    }
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat height = 0;
    if (section == 1) {
        height = 15;
    }
    else if (section == 2) {
        height = 50;
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = nil;
    if (section == 0) {
        headerView = _mineInfoHeaderView;
    }
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = nil;
    if (section == 2) {
        footerView = _mineInfoFooterView;
    }
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private methods

- (void)initToolBar
{
    [_mineInfoToolBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self initTitleView];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [closeButton setImage:[UIImage imageNamed:@"icon_close_large.png"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeSettingViewController) forControlEvents:UIControlEventTouchUpInside];
    _closeBarButton.customView = closeButton;
    [closeButton release];
}

- (void)initTitleView
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 35)];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"个人资料";
    _titleBarButton.customView = titleLabel;
    [titleLabel release];
}

- (void)initButton:(UIButton *)button withNormalImageName:(NSString *)nImageName andHighlightImageName:(NSString *)hImageName
{
    UIImage *btnImage = [UIImage imageNamed:nImageName];
    btnImage = [btnImage resizableImageWithCapInsets:UIEdgeInsetsMake(22, 20, 22, 20)];
    [button setBackgroundImage:btnImage forState:UIControlStateNormal];
    if (hImageName) {
        UIImage *btnImageActive = [UIImage imageNamed:hImageName];
        btnImageActive = [btnImageActive resizableImageWithCapInsets:UIEdgeInsetsMake(22, 20, 22, 20)];
        [button setBackgroundImage:btnImageActive forState:UIControlStateHighlighted];
    }
}

- (void)initMineHeaderView
{
    QBUser *qbUser = [Toolkit getQBUserLocal];
    if (qbUser && (NSNull *)qbUser.icon != [NSNull null]) {
        CALayer *layer = [_mineFaceButton layer];
        layer.cornerRadius = 3;
        layer.masksToBounds = YES;
        [_mineFaceButton setImageWithURL:[NSURL URLWithString:qbUser.avatar]];
    }
    if (qbUser && (NSNull *)qbUser.login != [NSNull null]) {
        [_mineNameLabel setText:qbUser.login];
    }
}

- (void)closeSettingViewController
{
    [self dismissSemiModalViewWithCompletion:nil];
}

@end
