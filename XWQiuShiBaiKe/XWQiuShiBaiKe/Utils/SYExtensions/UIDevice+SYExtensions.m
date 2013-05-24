//
//  UIDevice+SYExtensions.m
//  SYKit
//
//  Created by Johnny Luo on 12-10-16.
//  Copyright (c) 2012年 JE. All rights reserved.
//

#import "UIDevice+SYExtensions.h"

@implementation UIDevice (SYExtensions)

+ (NSString *)getUUID
{

//    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//    NSString *uuid = (NSString *)CFUUIDCreateString (kCFAllocatorDefault, uuidRef);

    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFStringCreateCopy(NULL, uuidString);
    CFRelease(puuid);
    CFRelease(uuidString);
    return [result autorelease];
}
@end
