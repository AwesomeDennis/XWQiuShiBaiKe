//
//  UIImage+SYExtensions.h
//  SYKit
//
//  Created by Johnny Luo on 12-10-9.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SYExtensions)

- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)imageWithAlpha;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

- (UIImage *)makeRoundedCornerImage:(CGSize)cornerSize borderSize:(NSUInteger)borderSize;
- (UIImage *)makeTransparentBorderImage:(NSUInteger)borderSize;

+ (UIImage *)convertImageFromView:(UIView*)view;

+ (BOOL)isExistImage:(NSString*)imageName onLocal:(NSString*)path;
+ (void)saveImageData:(NSData*)imageData withName:(NSString*)imageName onLocal:(NSString*)path;
+ (UIImage *)loadImage:(NSString*)imageName onLocal:(NSString*)path;

@end
