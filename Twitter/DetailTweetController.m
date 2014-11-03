//
//  DetailTweetController.m
//  Twitter
//
//  Created by Vinit Patwa on 11/2/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "DetailTweetController.h"
#import "UIImageView+AFNetworking.h"
#import "NSDate+DateTools.h"

@interface DetailTweetController ()

@end

@implementation DetailTweetController

BOOL fav = true;
BOOL retweet = true;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.text = self.currentTweet.user.name;
    self.screenName.text = [NSString stringWithFormat:@"@%@",self.currentTweet.user.screenname];
    self.tweet.text = self.currentTweet.text;
    NSString *userimageUrl = self.currentTweet.user.profileImageUrl;
    [self.userImage setImageWithURL:[NSURL URLWithString:userimageUrl]];
    self.reTweetCount.text = [NSString stringWithFormat:@"%@",self.currentTweet.reTweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%@",self.currentTweet.favoriteCount];
    self.title = @"Tweet";
    self.date.text = [NSString stringWithFormat:@"%@ ago", self.currentTweet.createdAt.shortTimeAgoSinceNow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)onFavorite:(id)sender {
    if (fav) {
        fav = !fav;
        UIImage *favorite_hover = [UIImage imageNamed:@"favorite_hover"];
        [self.favorite setImage:favorite_hover forState:UIControlStateNormal];
        int fav_count = self.favoriteCount.text.intValue + 1;
        self.favoriteCount.text = [NSString stringWithFormat:@"%d", fav_count];
        
    } else {
        fav = !fav;
        UIImage *favorite_hover = [UIImage imageNamed:@"favorite"];
        [self.favorite setImage:favorite_hover forState:UIControlStateNormal];
        int fav_count = self.favoriteCount.text.intValue - 1;
        self.favoriteCount.text = [NSString stringWithFormat:@"%d", fav_count];
    }
}

- (IBAction)onRetweet:(id)sender {
    if (retweet) {
        retweet = !retweet;
        UIImage *reTweet_hover = [UIImage imageNamed:@"retweet_hover"];
        [self.reTweet setImage:reTweet_hover forState:UIControlStateNormal];
        int retweet_count = self.reTweetCount.text.intValue + 1;
        self.reTweetCount.text = [NSString stringWithFormat:@"%d", retweet_count];
        
    } else {
        retweet = !retweet;
        UIImage *reTweet_hover = [UIImage imageNamed:@"retweet"];
        [self.reTweet setImage:reTweet_hover forState:UIControlStateNormal];
        int retweet_count = self.reTweetCount.text.intValue - 1;
        self.reTweetCount.text = [NSString stringWithFormat:@"%d", retweet_count];
    }
}
@end
