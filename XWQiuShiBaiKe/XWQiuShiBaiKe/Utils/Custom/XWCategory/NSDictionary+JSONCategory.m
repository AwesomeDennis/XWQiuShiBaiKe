//
//  NSDictionary+JSONCategory.m
//  XWQiuShiBaiKe
//
//  Created by Ren XinWei on 13-5-29.
//  Copyright (c) 2013年 renxinwei's iMac. All rights reserved.
//

#import "NSDictionary+JSONCategory.h"

@implementation NSDictionary (JSONCategory)

+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAddress]];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    
    return result;
}

- (NSData *)toJSON
{
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    
    return result;
}

@end
