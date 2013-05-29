//
//  NSDictionary+JSONCategory.h
//  XWQiuShiBaiKe
//
//  Created by Ren XinWei on 13-5-29.
//  Copyright (c) 2013年 renxinwei's iMac. All rights reserved.
//

//将JSON格式的Data转换为Foundation(NSDictionary、NSData) 用来解析
//+ JSONObjectWithData:options:error:
//
//将Foundation(NSDictionary、NSData) 转换为JSon格式的NSData 用来发送
//+ dataWithJSONObject:options:error:

#import <Foundation/Foundation.h>

/*NSDictionary提供json支持*/
@interface NSDictionary (JSONCategory)

+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString*)urlAddress;
- (NSData *)toJSON;

@end
