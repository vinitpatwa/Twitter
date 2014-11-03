//
//  Tweet.h
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *reTweetCount;
@property (nonatomic, strong) NSString *favoriteCount;

- (id) initWithDictionary:(NSDictionary *)dictionary;

+(NSArray *)tweetsWithArray:(NSArray *)array;


@end
