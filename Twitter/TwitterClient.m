//
//  TwitterClient.m
//  Twitter
//
//  Created by Vinit Patwa on 11/1/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey = @"WoARkzSRjUZkRHRzaS4g";
NSString * const kTwitterConsumerSecret = @"6GI9X1FKyAEi6zl480rAYIyRU5CM41lD4Xq6srJIVw";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@interface TwitterClient ()
@property (nonatomic, strong) void (^loginCompletion)(User *user, NSError *error);
@property (nonatomic, strong) void (^homeTimeLine)(NSArray *tweets, NSError *error);
@property (nonatomic, strong) void (^updateStatus)(Tweet *tweet, NSError *error);
@end

@implementation TwitterClient

+ (TwitterClient *)sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[TwitterClient alloc]initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

-(void)loginWithCompletion:(void (^)(User *user, NSError *error))completion{
    
    self.loginCompletion = completion;
    
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"mytwitterclient://oauth"] scope:nil success:^(BDBOAuthToken *requestToken) {
        NSLog(@"got the request Token");
        
        NSURL *authURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
        
    } failure:^(NSError *error) {
        NSLog(@"got the request Token");
        self.loginCompletion(nil, error);
    }];
    
}

-(void) openURL:(NSURL *)url{
    [[TwitterClient sharedInstance] fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuthToken tokenWithQueryString:url.query] success:^(BDBOAuthToken *accessToken) {
        [self.requestSerializer saveAccessToken:accessToken];
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            User *user = [[User alloc] initWithDictionary:responseObject];
            NSLog(@"current username: %@", user.name);
            NSLog(@"current screenname: %@", user.screenname);
            self.loginCompletion(user, nil);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"failed user");
            self.loginCompletion(nil, error);
        }];
    } failure:^(NSError *error) {
        NSLog(@"error access token");
        self.loginCompletion(nil, error);
    }];
}

-(void)getHomeTimeLine:(void (^)(NSArray *tweets, NSError *error))completion{
    self.homeTimeLine = completion;
    [self GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        self.homeTimeLine(tweets, nil);
//        for (Tweet *tweet in tweets){
//            NSLog(@"tweet: %@, created at: %@", tweet.text, tweet.createdAt);
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed tweet");
        self.homeTimeLine(nil,error);
    }];
}

-(void)getMentionTimeLine:(void (^)(NSArray *tweets, NSError *error))completion{
    self.homeTimeLine = completion;
    [self GET:@"1.1/statuses/mentions_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        self.homeTimeLine(tweets, nil);
//        for (Tweet *tweet in tweets){
//            NSLog(@"tweet: %@, created at: %@", tweet.text, tweet.createdAt);
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed tweet");
        self.homeTimeLine(nil,error);
    }];
}

- (AFHTTPRequestOperation *)update:(NSString *)status
                                     success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                                     failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure {
    NSDictionary *parameters = @{@"status": status};
    return [self POST:@"1.1/statuses/update.json" parameters:parameters success:success failure:failure];
}

@end
