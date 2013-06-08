//
//  CreateQiuShiViewController.h
//  XWQiuShiBaiKe
//
//  Created by Ren XinWei on 13-5-31.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWPlaceHolderTextView.h"
#import "ASIHTTPRequest.h"

@interface CreateQiuShiViewController : UIViewController <ASIHTTPRequestDelegate>

@property (retain, nonatomic) ASIHTTPRequest *createQSRequest;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *closeBarButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *titleBarButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *sendBarButton;
@property (retain, nonatomic) IBOutlet UIToolbar *createQSToolBar;
@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (retain, nonatomic) IBOutlet XWPlaceHolderTextView *qsContentTextView;

@end
