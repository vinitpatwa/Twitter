//
//  User.m
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];
        self.follower = [dictionary[@"followers_count"] intValue];
        self.following = [dictionary[@"friends_count"] intValue];
        
//        [dictionary[@"followers_count"] intValue]
//        
//        
//        self.followerCount = [dictionary[@"followers_count"] intValue];
//        self.followingCount = [dictionary[@"friends_count"] intValue];
//        self.statusesCount = dictionary[@"statuses_count"];
//        self.id = dictionary[@"id"];
    }
    return self;
}


@end
