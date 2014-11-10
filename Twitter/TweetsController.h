//
//  TweetsController.h
//  Twitter
//
//  Created by Vinit Patwa on 10/30/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface TweetsController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property  (nonatomic, strong) User *currentUser;
@property (strong, nonatomic) NSMutableArray *tweets;
@property  (strong, nonatomic) NSString *mentions;

@end
