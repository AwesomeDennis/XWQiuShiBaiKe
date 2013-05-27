//
//  Toolkit.m
//  XWQSBK
//
//  Created by renxinwei on 13-4-30.
//  Copyright (c) 2013年 renxinwei. All rights reserved.
//

#import "Toolkit.h"

@implementation Toolkit

//获取整个应用通用的背景色
+ (UIColor *)getAppBackgroundColor
{
    UIImage *image = [UIImage imageNamed:@"main_background.png"];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:image];
    return backgroundColor;
}

//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSString *)dateStringAfterRandomDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    //这边填入需要增加的天数
    [componentsToAdd setDay:[Toolkit getRandomDay]];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromDate=[dateFormatter dateFromString:@"2006-11-10"];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:fromDate options:0];
    [componentsToAdd release];
    
    NSString *dateStr = [dateFormatter stringFromDate:dateAfterDay];
    [dateFormatter release];
    
    return dateStr;
}

//获取一个随机的天数
+ (NSInteger)getRandomDay
{
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:@"2006-11-10 10:10:10"];
    
    NSTimeInterval late = [d timeIntervalSince1970] * 1;
    
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970] * 1;
    NSString *timeString = @"";
    NSTimeInterval cha = now - late;
    timeString = [NSString stringWithFormat:@"%f", cha / 86400];
    timeString = [timeString substringToIndex:timeString.length - 7];
    [date release];
    NSInteger randomDay = 1;
    randomDay = arc4random_uniform([timeString integerValue]) + 1;
    
    return randomDay;
}

@end
