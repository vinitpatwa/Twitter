//
//  TweetCell.h
//  Twitter
//
//  Created by Vinit Patwa on 10/30/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userimage;
@property (weak, nonatomic) IBOutlet UILabel *userFirstName;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *Tweet;
@property (weak, nonatomic) IBOutlet UIButton *reTweet;
@property (nonatomic, strong) Tweet *currentTweet;
@property (nonatomic, strong) UIViewController* parentController;
- (IBAction)onReTweetCell:(id)sender;
@end
