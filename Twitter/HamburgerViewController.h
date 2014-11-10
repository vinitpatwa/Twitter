//
//  HamburgerViewController.h
//  Twitter
//
//  Created by Vinit Patwa on 11/9/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HamburgerViewController : UIViewController
@property (strong, nonatomic) UIViewController *leftViewController;
@property (strong, nonatomic) UIViewController *contentViewController;

+ (HamburgerViewController *)sharedInstance;
- (void)closeMenu;
- (void)openMenu;
@end
