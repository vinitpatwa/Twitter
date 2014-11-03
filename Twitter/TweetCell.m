//
//  TweetCell.m
//  Twitter
//
//  Created by Vinit Patwa on 10/30/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "TweetCell.h"

@interface TweetCell ()

- (IBAction)replyButton:(id)sender;
- (IBAction)favoriteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *favorite;
@property (weak, nonatomic) IBOutlet UIButton *retweet;
@property (weak, nonatomic) IBOutlet UIButton *reply;

@end

@implementation TweetCell

BOOL favOne = true;
BOOL reTweetOne = true;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)replyButton:(id)sender {
}

- (IBAction)reTweetButton:(id)sender {
    if (reTweetOne) {
        reTweetOne = !reTweetOne;
        UIImage *reTweet_hover = [UIImage imageNamed:@"retweet_hover"];
        [self.retweet setImage:reTweet_hover forState:UIControlStateNormal];
    } else {
        reTweetOne = !reTweetOne;
        UIImage *reTweet_hover = [UIImage imageNamed:@"retweet"];
        [self.retweet setImage:reTweet_hover forState:UIControlStateNormal];
    }
}

- (IBAction)favoriteButton:(id)sender {
    if (favOne) {
        favOne = !favOne;
        UIImage *favorite_hover = [UIImage imageNamed:@"favorite_hover"];
        [self.favorite setImage:favorite_hover forState:UIControlStateNormal];
    } else {
        favOne = !favOne;
        UIImage *favorite_hover = [UIImage imageNamed:@"favorite"];
        [self.favorite setImage:favorite_hover forState:UIControlStateNormal];
    }
}
- (IBAction)onReTweetCell:(id)sender {
    if (reTweetOne) {
        reTweetOne = !reTweetOne;
        UIImage *retweet_hover = [UIImage imageNamed:@"retweet_hover"];
        [self.reTweet setImage:retweet_hover forState:UIControlStateNormal];
    } else {
        reTweetOne = !reTweetOne;
       UIImage *retweet_hover = [UIImage imageNamed:@"retweet"];
        [self.reTweet setImage:retweet_hover forState:UIControlStateNormal];    }
}
@end
