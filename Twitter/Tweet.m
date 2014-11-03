//
//  Tweet.m
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "Tweet.h"


@implementation Tweet

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.text = dictionary[@"text"];
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        
        NSString *createAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        
        self.createdAt = [formatter dateFromString:createAtString];
        self.favoriteCount = dictionary[@"favorite_count"];
        self.reTweetCount = dictionary[@"retweet_count"];
        NSLog(@"%@", dictionary);
        NSLog(@"fav %@", dictionary[@"favorite_count"]);
        NSLog(@"retweet %@", dictionary[@"retweet_count"]);
//        dictionary[@"screen_name"];
//        self.profileImageUrl = dictionary[@"profile_image_url"];
//        self.tagline = dictionary[@"description"];
    }
    return self;
}

+(NSArray *)tweetsWithArray:(NSArray *)array{
    NSMutableArray *tweets = [[NSMutableArray alloc]init];
    for(NSDictionary *dictionary in array){
        [tweets addObject:[[Tweet alloc]initWithDictionary:dictionary]];
    }
    return tweets;
}

@end
