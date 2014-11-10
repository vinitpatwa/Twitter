//
//  TwitterClient.h
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"
#import "Tweet.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *)sharedInstance;

-(void)loginWithCompletion:(void (^)(User *user, NSError *error))completion;
-(void)openURL:(NSURL *)url;
-(void)getHomeTimeLine:(void (^)(NSArray *tweets, NSError *error))completion;
-(void)getMentionTimeLine:(void (^)(NSArray *tweets, NSError *error))completion;

- (AFHTTPRequestOperation *)update:(NSString *)status success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

@end
