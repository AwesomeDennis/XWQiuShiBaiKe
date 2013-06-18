//
//  NeiHanVideoDetailViewController.m
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-6-18.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import "NeiHanVideoDetailViewController.h"

@interface NeiHanVideoDetailViewController ()
@property (strong, nonatomic) VideoPlayerKit *videoPlayerViewController;
@end

@implementation NeiHanVideoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"视频详情";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initViews];
    
    _videoBodyLabel.text = [_videoDict objectForKey:@"wbody"];
    NSURL *url = [NSURL URLWithString:[_videoDict objectForKey:@"vplay_url"]];
    if (!self.videoPlayerViewController) {
        self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:nil hideTopViewWithControls:YES];
        // Need to set edge inset if top view is inserted
        //[self.videoPlayerViewController setControlsEdgeInsets:UIEdgeInsetsMake(self.topView.frame.size.height, 0, 0, 0)];
        self.videoPlayerViewController.delegate = self;
        self.videoPlayerViewController.allowPortraitFullscreen = NO;
    }
    [self.videoPlayerViewController.view setFrame:CGRectMake(0, 0, 320, 230)];
    [self.view addSubview:self.videoPlayerViewController.view];
    [self.videoPlayerViewController playVideoWithTitle:@"" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"rotate:%d", toInterfaceOrientation);
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)backButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
- (void)dealloc
{
    [_backButton release];
    [_videoBodyLabel release];
    [super dealloc];
}
*/
- (void)viewDidUnload
{
    [self setBackButton:nil];
    [self setVideoBodyLabel:nil];
    [super viewDidUnload];
}

#pragma mark - Private methods

- (void)initViews
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
}

// Fullscreen / minimize without need for user's input
- (void)fullScreen
{
    if (!self.videoPlayerViewController.fullScreenModeToggled) {
        [self.videoPlayerViewController launchFullScreen];
    } else {
        [self.videoPlayerViewController minimizeVideo];
    }
}

@end
