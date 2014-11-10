//
//  ProfileController.m
//  Twitter
//
//  Created by Vinit Patwa on 11/9/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "ProfileController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;
@property (weak, nonatomic) IBOutlet UILabel *userStatus;
@property (weak, nonatomic) IBOutlet UILabel *follower;
@property (weak, nonatomic) IBOutlet UILabel *following;


@end

@implementation ProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.userName.text = self.user.name;
    self.userScreenName.text = [NSString stringWithFormat:@"@%@",self.user.screenname];

    NSString *userimageUrl = self.user.profileImageUrl;
    [self.userProfilePic setImageWithURL:[NSURL URLWithString:userimageUrl]];
    
    self.userStatus.text = self.user.tagline;
    
    self.follower.text = [NSString stringWithFormat:@"%d Follower",self.user.follower];
    self.following.text = [NSString stringWithFormat:@"%d Following",self.user.following];
    
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

@end
