//
//  User.h
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenname;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *tagline;
@property int  follower;
@property int following;
@property int tweetsCount;


//@property (nonatomic, strong) long *userID;

- (id) initWithDictionary:(NSDictionary *)dictionary;

@end
