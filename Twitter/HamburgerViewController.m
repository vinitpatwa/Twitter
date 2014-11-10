//
//  HamburgerViewController.m
//  Twitter
//
//  Created by Vinit Patwa on 11/9/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "HamburgerViewController.h"
#import "SettingsController.h"

@interface HamburgerViewController ()
@property (weak, nonatomic) IBOutlet UIView *menuView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation HamburgerViewController

+ (HamburgerViewController *)sharedInstance {
    static HamburgerViewController* sharedInstance = nil;
    if (sharedInstance == nil) {
        sharedInstance = [[HamburgerViewController alloc]init];
    }
    return sharedInstance;
}

- (IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    NSLog(@"point : %@", NSStringFromCGPoint(point));
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    NSLog(@"velocity : %f", velocity.x);
    
    if (velocity.x < 0) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:0 animations:^{
            [self openMenu];
        } completion:nil];
    } else if (velocity.x > 0) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:0 animations:^{
            [self closeMenu];
        } completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.menuView insertSubview:_leftViewController.view belowSubview:self.contentView];
    [self.contentView addSubview:_contentViewController.view ];
}


- (void) setLeftViewController:(UIViewController *)leftViewController {
    NSLog(@"Setting left view");
    ((SettingsController *)leftViewController).hvc = self;
    _leftViewController = [[UINavigationController alloc] initWithRootViewController:leftViewController];
}

- (void) setContentViewController:(UIViewController *) contentViewController {
    NSLog(@"Setting Content view");
    _contentViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self.contentView addSubview:_contentViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openMenu {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
        
        CGRect frame = self.contentView.frame;
        frame.origin.x = self.view.frame.size.width - frame.size.width;
        [self.contentView setFrame:frame];
    } completion:nil];
    
    
    //    self.leftViewController.frame = CGRectMake(0, 0, self.menuView.frame.size.width, self.menuView.frame.size.height);
    //    [self.menuView addSubview:self.leftViewController];
}

- (void)closeMenu {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
        
        CGRect frame = self.contentView.frame;
        frame.origin.x = self.view.frame.size.width - 150;
        [self.contentView setFrame:frame];
    } completion:nil];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
