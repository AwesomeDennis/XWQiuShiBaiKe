//
//  CommentCell.h
//  XWQSBK
//
//  Created by renxinwei on 13-5-5.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell

@property (assign, nonatomic) NSInteger visibleFloor;
@property (retain, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *floorLabel;
@property (retain, nonatomic) IBOutlet UILabel *commentLabel;
@property (retain, nonatomic) IBOutlet UIImageView *blockLineImageView;

- (void)configCommentCellWithComment:(Comment *)comment;
+ (CGFloat)getCellHeight:(NSString *)comment;

@end
