//
//  LeftSideBarViewController.m
//  XWQSBK
//
//  Created by Ren XinWei on 13-4-28.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import "LeftSideBarViewController.h"
#import "SettingViewController.h"
#import "UIViewController+KNSemiModal.h"
#import "UIButton+WebCache.h"

@interface LeftSideBarViewController ()
{
    NSArray *_dataList;
}
@property (retain, nonatomic) NSIndexPath *selectIndexPath;

@end

@implementation LeftSideBarViewController

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
    _dataList = @[@"1",@"2",@"3",@"4",@"5"];
    if ([_delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [_delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        self.selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.sideMenuTableView selectRowAtIndexPath:_selectIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    [self initViews];
}

- (void)dealloc
{
    [_strollNavController release];
    [_strollVC release];
    [_eliteNavController release];
    [_eliteVC release];
    [_imageTruthNavController release];
    [_imageTruthVC release];
    [_traversingeNavController release];
    [_traversingVC release];
    [_sideSettingButton release];
    [_sideJoinQBButton release];
    [_sideTitleButton release];
    [_sideMenuTableView release];
    [_sideFaceButton release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"rotate");
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - UITableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 4;
            break;
        case 1:
            rows = 3;
            break;
        case 2:
            rows = 1;
            break;
        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SIDEMENUCELL";
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!menuCell) {
        menuCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    NSString *menuTitle = @"";
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    menuTitle = @"随便逛逛";
                    break;
                case 1:
                    menuTitle = @"精华";
                    break;
                case 2:
                    menuTitle = @"有图有真相";
                    break;
                case 3:
                    menuTitle = @"穿越";
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    menuTitle = @"我收藏的";
                    break;
                case 1:
                    menuTitle = @"我参与的";
                    break;
                case 2:
                    menuTitle = @"我发表的";
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    menuTitle = @"审核新糗事";
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    [self configCellAttribute:menuCell];
    menuCell.textLabel.text = menuTitle;
    
    return menuCell;
}

#pragma mark - UITableView delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = 0;
    if (section != 0) {
        headerHeight = 9;
    }
    
    return headerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = nil;
    if (section != 0) {
        headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 9)] autorelease];
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:headerView.frame];
//        UIImage *titleBackground = [UIImage imageNamed:@"side_title_background.png"];
//        titleBackground = [titleBackground resizableImageWithCapInsets:UIEdgeInsetsMake(4, 5, 5, 4)];
        [backgroundImageView setImage:[self getSideTitleBackgroundImage]];
        [headerView addSubview:backgroundImageView];
        [backgroundImageView release];
    }

    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        if ([indexPath isEqual:_selectIndexPath]) {
            [_delegate leftSideBarSelectWithController:nil];
        }
        else {
            [_delegate leftSideBarSelectWithController:[self subConWithIndex:indexPath]];
        }
    }
    self.selectIndexPath = indexPath;
}

#pragma mark - AuthViewController delegate method

- (void)QBUserDidLoginSuccessWithQBName:(NSString *)name andImage:(NSString *)imageUrl
{
    if (imageUrl) {
        [_sideFaceButton setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"side_user_avatar.png"]];
    }
    if (name) {
        [_sideJoinQBButton setTitle:name forState:UIControlStateNormal];
    }
}

#pragma mark - Private methods

- (UIViewController *)subConWithIndex:(NSIndexPath *)indexPath
{
    UIViewController *vc = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                if (_strollVC && _strollVC.isLoaded) {
                    return _strollNavController;
                }
                else {
                    _strollVC = [[StrollViewController alloc] initWithNibName:@"StrollViewController" bundle:nil];
                    _strollNavController = [self configNavigationController:_strollNavController withRootVC:_strollVC];
                    return _strollNavController;
                }
            }
                break;
            case 1:
            {
                if (_eliteVC && _eliteVC.isLoaded) {
                    return _eliteNavController;
                }
                else
                {
                    _eliteVC = [[EliteViewController alloc] initWithNibName:@"EliteViewController" bundle:nil];
                    _eliteNavController = [self configNavigationController:_eliteNavController withRootVC:_eliteVC];
                    return _eliteNavController;
                }
            }
                break;
            case 2:
            {
                if (_imageTruthVC && _imageTruthVC.isLoaded) {
                    return _imageTruthNavController;
                }
                else
                {
                    _imageTruthVC = [[ImageTruthViewController alloc] initWithNibName:@"ImageTruthViewController" bundle:nil];
                    _imageTruthNavController = [self configNavigationController:_imageTruthNavController withRootVC:_imageTruthVC];
                    return _imageTruthNavController;
                }
            }
                break;
            case 3:
            {
                if (_traversingVC && _traversingVC.isLoaded) {
                    return _traversingeNavController;
                }
                else
                {
                    _traversingVC = [[TraversingViewController alloc] initWithNibName:@"TraversingViewController" bundle:nil];
                    _traversingeNavController = [self configNavigationController:_traversingeNavController withRootVC:_traversingVC];
                    return _traversingeNavController;
                }
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1) {
        [[Dialog Instance] toast:@"你特么的别点咯，这东西还没做好啦"];
    }
    else {
        [[Dialog Instance] toast:@"这个真心没做，等等吧"];
    }

    return vc;
}

- (void)initViews
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"side_menu_textural.png"]]];
    [_sideJoinQBButton setBackgroundImage:[self getButtonBackgroundImage] forState:UIControlStateNormal];
    [_sideSettingButton setBackgroundImage:[self getSideTitleBackgroundImage] forState:UIControlStateNormal];
    [_sideTitleButton setBackgroundImage:[self getSideTitleBackgroundImage] forState:UIControlStateNormal];
}

- (UIImage *)getButtonBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"side_button_background.png"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(17, 17, 17, 16)];
    return image;
}

- (UIImage *)getSideTitleBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"side_title_background.png"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 4, 4, 4)];
    return image;
}

- (UINavigationController *)configNavigationController:(UINavigationController *)nav withRootVC:(UIViewController *)vc
{
    nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forBarMetrics:UIBarMetricsDefault];
    return nav;
}

- (void)configCellAttribute:(UITableViewCell *)cell
{
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"side_menu_background.png"]] autorelease];
    cell.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"side_menu_background_active.png"]] autorelease];
    UIImageView *arrowImageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"side_menu_arrow.png"]] autorelease];
    CGRect rect = arrowImageView.frame;
    rect.origin.x = 230;
    arrowImageView.frame = rect;
    [cell.contentView addSubview:arrowImageView];
}

#pragma mark - UIAction methods

- (IBAction)faceTitleView:(id)sender
{
    AuthViewController *authVC = [[[AuthViewController alloc] initWithNibName:@"AuthViewController" bundle:nil] autorelease];
    authVC.delegate = self;
    //UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:con];
    //[nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forBarMetrics:UIBarMetricsDefault];
    //[self presentViewController:con animated:YES completion:nil];
    [self presentSemiViewController:authVC];
}

- (IBAction)sideSettingButtonClicked:(id)sender
{
    SettingViewController *settingVC = [[[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil] autorelease];
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //[nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_background.png"] forBarMetrics:UIBarMetricsDefault];
    //[self presentViewController:nav animated:YES completion:nil];
    [self presentSemiViewController:settingVC];
}

- (void)viewDidUnload {
    [self setSideFaceButton:nil];
    [super viewDidUnload];
}
@end
