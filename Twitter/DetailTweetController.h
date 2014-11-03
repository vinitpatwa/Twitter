//
//  DetailTweetController.h
//  Twitter
//
//  Created by Vinit Patwa on 11/2/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface DetailTweetController : UIViewController
@property  (nonatomic, strong) Tweet *currentTweet;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *tweet;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *reTweetCount;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
- (IBAction)onFavorite:(id)sender;
- (IBAction)onRetweet:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reTweet;
@property (weak, nonatomic) IBOutlet UIButton *favorite;

@end
