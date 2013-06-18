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

@property (strong, nonatomic) NSDictionary *videoDict;

@property (strong, nonatomic) IBOutlet UILabel *videoBodyLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)backButtonClicked:(id)sender;

@end
