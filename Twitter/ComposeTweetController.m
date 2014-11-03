//
//  ComposeTweetController.m
//  Twitter
//
//  Created by Vinit Patwa on 11/2/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "ComposeTweetController.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"
#import "TweetsController.h"

@interface ComposeTweetController ()
@property (nonatomic, strong) IBOutlet UILabel *tweetCharLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ComposeTweetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
//    _tweetCharLabel = [[UILabel init] alloc];
//    UIView *tweetCount = _tweetCharLabel;
//    _tweetCharLabel.text = @"0";
//    UIBarButtonItem *myTweetCharButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tweetCount];
//    self.navigationItem.rightBarButtonItem = myTweetCharButtonItem;
    
//    _tweetCharLabel = [[UILabel alloc]init];
//    
//    view set
//    _tweetCharLabel.text = @"0";
    
    UIView *view = [[UILabel alloc]init];
    [view setTintColor:[UIColor redColor]];
    UIBarButtonItem *tweetCountItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [tweetCountItem setTitle:@"0"];
    self.navigationItem.rightBarButtonItem = tweetCountItem;
    UIBarButtonItem *tweeetButton = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onPostTweet)];
    
    NSArray *actionButtonItems = @[tweetCountItem, tweeetButton];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    self.username.text = self.user.name;
    self.userScreenName.text = [NSString stringWithFormat:@"@%@",self.user.screenname];
    NSString *userimageUrl = self.user.profileImageUrl;
    [self.userImage setImageWithURL:[NSURL URLWithString:userimageUrl]];
    
    self.textField.borderStyle = UITextBorderStyleNone;
    
    
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
   #define MAX_LENGTH 20

    if (textField.text.length >= MAX_LENGTH && range.length == 0)
    {
        return NO; // return NO to not change text
    }
    else
    {return YES;}
}

#pragma mark - Private Methods
- (void) onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) onPostTweet {
    [[TwitterClient sharedInstance] update:self.textField.text
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"posted tweet success");
         [self dismissViewControllerAnimated:YES completion:nil];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"posted tweet failure: %@", error.description);
     }];
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
