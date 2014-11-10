//
//  SettingsController.h
//  Twitter
//
//  Created by Vinit Patwa on 11/9/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HamburgerViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface SettingsController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, atomic) HamburgerViewController *hvc;
@property  (nonatomic, strong) User *currentUser;

@end
