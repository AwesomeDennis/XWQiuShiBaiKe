//
//  NeiHanVideoDetailViewController.h
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-6-18.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayerKit.h"

@interface NeiHanVideoDetailViewController : UIViewController <VideoPlayerDelegate>

@property (retain, nonatomic) NSDictionary *videoDict;
@property (retain, nonatomic) VideoPlayerKit *videoPlayerViewController;
@property (retain, nonatomic) IBOutlet UILabel *videoBodyLabel;
@property (retain, nonatomic) IBOutlet UIButton *backButton;
@property (retain, nonatomic) IBOutlet UIButton *shareButton;

- (IBAction)backButtonClicked:(id)sender;
- (IBAction)shareButtonClicked:(id)sender;

@end
