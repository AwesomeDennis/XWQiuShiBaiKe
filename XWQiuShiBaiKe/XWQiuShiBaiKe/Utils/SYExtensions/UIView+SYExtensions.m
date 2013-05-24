//
//  UIView+SYExtensions.m
//  SYKit
//
//  Created by Johnny Luo on 12-10-11.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "UIView+SYExtensions.h"

@implementation UIView (SYExtensions)

#pragma mark -
#pragma mark Positioning methods

- (void)centerInRect:(CGRect)rect;
{
    [self setCenter:CGPointMake(floorf(CGRectGetMidX(rect)) + ((int)floorf([self width]) % 2 ? .5 : 0) , floorf(CGRectGetMidY(rect)) + ((int)floorf([self height]) % 2 ? .5 : 0))];
}

- (void)centerVerticallyInRect:(CGRect)rect;
{
    [self setCenter:CGPointMake([self center].x, floorf(CGRectGetMidY(rect)) + ((int)floorf([self height]) % 2 ? .5 : 0))];
}

- (void)centerHorizontallyInRect:(CGRect)rect;
{
    [self setCenter:CGPointMake(floorf(CGRectGetMidX(rect)) + ((int)floorf([self width]) % 2 ? .5 : 0), [self center].y)];
}

- (void)centerInSuperView;
{
    [self centerInRect:[[self superview] bounds]];
}
- (void)centerVerticallyInSuperView;
{
    [self centerVerticallyInRect:[[self superview] bounds]];
}
- (void)centerHorizontallyInSuperView;
{
    [self centerHorizontallyInRect:[[self superview] bounds]];
}

//- (void)centerHorizontallyBelow:(UIView *)view padding:(CGFloat)padding;
//{
//    // for now, could use screen relative positions.
//    NSAssert([self superview] == [view superview], @"views must have the same parent");
//    
//    [self setCenter:CGPointMake([view center].x,
//                                floorf(padding + CGRectGetMaxY([view frame]) + ([self height] / 2)))];
//}
//
//- (void)centerHorizontallyBelow:(UIView *)view;
//{
//    [self centerHorizontallyBelow:view padding:0];
//}


#pragma mark -
#pragma mark InnerShadow methods

// sourced from http://stackoverflow.com/questions/4431292/inner-shadow-effect-on-uiview-layer

- (void)drawInnerShadowInRect:(CGRect)rect radius:(CGFloat)radius fillColor:(UIColor *)fillColor;
{
    CGRect bounds = [self bounds];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat outsideOffset = 20.f;
    
    CGMutablePathRef visiblePath = CGPathCreateMutable();
    CGPathMoveToPoint(visiblePath, NULL, bounds.size.width-radius, bounds.size.height);
    CGPathAddArc(visiblePath, NULL, bounds.size.width-radius, radius, radius, 0.5f*M_PI, 1.5f*M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, radius, 0.f);
    CGPathAddArc(visiblePath, NULL, radius, radius, radius, 1.5f*M_PI, 0.5f*M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, bounds.size.width-radius, bounds.size.height);
    CGPathCloseSubpath(visiblePath);
    
    [fillColor setFill];
    CGContextAddPath(context, visiblePath);
    CGContextFillPath(context);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, -outsideOffset, -outsideOffset);
    CGPathAddLineToPoint(path, NULL, bounds.size.width+outsideOffset, -outsideOffset);
    CGPathAddLineToPoint(path, NULL, bounds.size.width+outsideOffset, bounds.size.height+outsideOffset);
    CGPathAddLineToPoint(path, NULL, -outsideOffset, bounds.size.height+outsideOffset);
    CGPathAddLineToPoint(path, NULL, -outsideOffset, -outsideOffset);
    
    CGPathAddPath(path, NULL, visiblePath);
    CGPathCloseSubpath(path);
    
    CGContextAddPath(context, visiblePath);
    CGContextClip(context);
    
    UIColor * shadowColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 4.0f), 8.0f, [shadowColor CGColor]);
    [shadowColor setFill];
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    CGPathRelease(path);
    CGPathRelease(visiblePath);
    CGContextRestoreGState(context);
}

- (void)drawInnerShadowInRect:(CGRect)rect
                       radius:(CGFloat)radius
                    fillColor:(UIColor *)fillColor
                  shadowColor:(UIColor *)shadowColor
                 shadowOffset:(CGSize)shadowOffset
                   shadowBlur:(CGFloat)blur;
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat outsideOffset = 20.f;
//    CGRect bounds = [self bounds];

    CGMutablePathRef visiblePath = CGPathCreateMutable();
    CGPathMoveToPoint(visiblePath, NULL, radius, 0);
    CGPathAddArc(visiblePath, NULL, radius, radius, radius, 1.5f * M_PI, 1.0f * M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, 0, CGRectGetHeight(rect) - radius);
    CGPathAddArc(visiblePath, NULL, radius, CGRectGetHeight(rect) - radius, radius, 1.0f * M_PI, 0.5f * M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, CGRectGetWidth(rect) - radius, CGRectGetHeight(rect));
    CGPathAddArc(visiblePath, NULL, CGRectGetWidth(rect) - radius, CGRectGetHeight(rect) - radius, radius, 0.5f * M_PI, 0.0f * M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, CGRectGetWidth(rect), radius);
    CGPathAddArc(visiblePath, NULL, CGRectGetWidth(rect) - radius, radius, radius, 0.0f * M_PI, 1.5f * M_PI, YES);
    CGPathAddLineToPoint(visiblePath, NULL, radius, 0);
    CGPathCloseSubpath(visiblePath);
    
    [fillColor setFill];
    CGContextAddPath(context, visiblePath);
    CGContextFillPath(context);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, -outsideOffset, -outsideOffset);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect)+outsideOffset, -outsideOffset);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect)+outsideOffset, CGRectGetHeight(rect)+outsideOffset);
    CGPathAddLineToPoint(path, NULL, -outsideOffset, CGRectGetHeight(rect)+outsideOffset);
    
    CGPathAddPath(path, NULL, visiblePath);
    CGPathCloseSubpath(path);
    
    CGContextAddPath(context, visiblePath);
    CGContextClip(context);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, blur, [shadowColor CGColor]);
    [shadowColor setFill];
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    CGPathRelease(path);
    CGPathRelease(visiblePath);
    CGContextRestoreGState(context);
}

- (void)drawInnerShadowInRect:(CGRect)rect fillColor:(UIColor *)fillColor
{
    [self drawInnerShadowInRect:rect radius:(0.5f * CGRectGetHeight(rect)) fillColor:fillColor];
}

#pragma mark -
#pragma mark Autoresize methods

- (CGFloat)getViewFillHeight
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.subviews)
    {
        scrollViewHeight = scrollViewHeight > CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) ? scrollViewHeight: CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame);
    }
    return scrollViewHeight;
}

- (void)autoresizeViewHeight
{
    [self autoresizeViewHeightWithMarginBottom:0.0f];
}

- (void)autoresizeViewHeightWithMarginBottom:(CGFloat)marginBottom
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.subviews)
    {
        scrollViewHeight = scrollViewHeight > CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) ? scrollViewHeight: CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame);
    }
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), scrollViewHeight + marginBottom)];
}

- (void)autoresizeViewHeightWithMarginBottom:(CGFloat)marginBottom without:(Class)class
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.subviews)
    {
        if(![view isKindOfClass:class]){
            scrollViewHeight = scrollViewHeight > CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) ? scrollViewHeight: CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame);
        }
    }
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), scrollViewHeight + marginBottom)];
}

#pragma mark -

- (void)addSubviewFollowBottom:(UIView *)subview
{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.subviews)
    {
        scrollViewHeight = scrollViewHeight > CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) ? scrollViewHeight: CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame);
    }
    subview.frame = CGRectMake(subview.frame.origin.x, scrollViewHeight, subview.frame.size.width, subview.frame.size.height);
    [self addSubview:subview];
}

#pragma mark -
#pragma mark Private helper methods

- (void)setSize:(CGSize)size
{
    CGPoint origin = [self frame].origin;
    
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

- (CGSize)size
{
    return [self frame].size;
}

- (CGFloat)left
{
    return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)top
{
    return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)right
{
    return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = [self frame];
    frame.origin.x = right - frame.size.width;
    
    [self setFrame:frame];
}

- (CGFloat)bottom
{
    return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = [self frame];
    frame.origin.y = bottom - frame.size.height;
    
    [self setFrame:frame];
}

- (CGFloat)centerX
{
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX
{
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY
{
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY
{
    [self setCenter:CGPointMake(self.center.x, centerY)];
}

- (CGFloat)width
{
    return CGRectGetWidth([self frame]);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = [self frame];
    frame.size.width = width;
    
    [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)height
{
    return CGRectGetHeight([self frame]);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = [self frame];
    frame.size.height = height;
	
    [self setFrame:CGRectStandardize(frame)];
}

@end
