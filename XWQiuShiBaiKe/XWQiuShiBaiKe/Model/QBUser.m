//
//  QBUser.m
//  XWQiuShiBaiKe
//
//  Created by renxinwei on 13-5-29.
//  Copyright (c) 2013年 renxinwei's iMac. All rights reserved.
//

#import "QBUser.h"

@implementation QBUser

static QBUser *instance = nil;
+ (QBUser *)shareInstance
{
    @synchronized(self)
    {
        if (instance == nil) {
            instance = [self new];
        }
    }
    return instance;
}

- (id)initWithQBUserDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.last_visited_at = [dictionary objectForKey:@"last_visited_at"];
        self.created_at = [dictionary objectForKey:@"created_at"];
        self.state = [dictionary objectForKey:@"state"];
        self.email = [dictionary objectForKey:@"email"];
        self.last_device = [dictionary objectForKey:@"last_device"];
        self.role = [dictionary objectForKey:@"role"];
        self.login = [dictionary objectForKey:@"login"];
        self.qbId = [dictionary objectForKey:@"id"];
        
        NSString *icon = [dictionary objectForKey:@"icon"];
        if (((NSNull *)icon) != [NSNull null]) {
            self.icon = icon;
            if ([self.qbId length] > 3) {
                NSString *prefixAuthorID = [_qbId substringWithRange:NSMakeRange(0, 3)];
                NSString *newAuthorImageURL = [NSString stringWithFormat:@"http://pic.moumentei.com/system/avtnew/%@/%@/thumb/%@", prefixAuthorID, _qbId, icon];
                self.icon = newAuthorImageURL;
            }
        }
    }
    
    return self;
}

- (void)dealloc
{
    _last_visited_at = nil;
    _created_at = nil;
    _state = nil;
    _email = nil;
    _last_device = nil;
    _role = nil;
    _login = nil;
    _qbId = nil;
    _icon = nil;
    
    [super dealloc];
}

@end
