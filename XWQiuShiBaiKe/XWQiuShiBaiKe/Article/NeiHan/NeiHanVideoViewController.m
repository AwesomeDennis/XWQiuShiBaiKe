//
//  NeiHanVideoViewController.m
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-6-17.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import "NeiHanVideoViewController.h"

@interface NeiHanVideoViewController ()

@end

@implementation NeiHanVideoViewController

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
    //http://my.tv.sohu.com/ipad/57087853.m3u8
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)dealloc
{
    [_sideButton release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setSideButton:nil];
    [super viewDidUnload];
}

#pragma mark - UIAction method

- (IBAction)sideButtonClicked:(id)sender
{
}

@end
