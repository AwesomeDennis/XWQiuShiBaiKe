//
//  SliderSwitch.h
//  XWQSBK
//
//  Created by Ren XinWei on 13-5-4.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XWSliderSwitch;

@protocol XWSliderSwitchDelegate <NSObject>

@optional
- (void)slideView:(XWSliderSwitch *)slideSwitch switchChangedAtIndex:(NSInteger)index;

@end

@interface XWSliderSwitch : UIView
{
    UILabel *_labelOne, *_labelTwo,* _labelThree;
    UIButton *_toggleButton;
}

@property (nonatomic) NSInteger labelCount;
@property (nonatomic, assign) id<XWSliderSwitchDelegate> delegate;

- (void)initSliderSwitch;
- (void)setSliderSwitchBackground:(UIImage *)image;
- (void)setLabelOneText:(NSString *)text;
- (void)setLabelTwoText:(NSString *)text;
- (void)setLabelThreeText:(NSString *)text;

@end
