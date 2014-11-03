//
//  TweetsController.m
//  Twitter
//
//  Created by Vinit Patwa on 10/30/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//

#import "TweetsController.h"
#import "TweetCell.h"
#import "TwitterClient.h"
#import "UIImageView+AFNetworking.h"
#import "DetailTweetController.h"
#import "ComposeTweetController.h"
#import "NSDate+DateTools.h"
#import "SVProgressHUD.h"

@interface TweetsController ()
@property (strong, nonatomic) IBOutlet UITableView *tweetsview;


@end

@implementation TweetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showWithStatus];
    
    self.tweetsview.delegate = self;
    self.tweetsview.dataSource = self;
    self.tableView.rowHeight = 180;
    
    UINib *tweetCellNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tweetsview registerNib:tweetCellNib forCellReuseIdentifier:@"TweetCell"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(onNewTweet)];
    self.title = @"Twitter";
    
    [[TwitterClient sharedInstance] getHomeTimeLine:^(NSArray *tweets, NSError *error) {
        if(tweets != nil){
            self.tweets = tweets;
            //show Tweets
            NSLog(@"Welcome %lu", tweets.count);
            [self.tweetsview reloadData];
            [self dismissSuccess];
        }else {
            //show error view
            [self dismissError];
        }
    }];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell *cell = [self.tweetsview  dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    Tweet *t = self.tweets[indexPath.row];
    cell.userFirstName.text  = t.user.name;
    cell.username.text = [NSString stringWithFormat:@"@%@",t.user.screenname];
    cell.Tweet.text = t.text;
    cell.time.text   = t.createdAt.shortTimeAgoSinceNow;
    NSString *userimageUrl = t.user.profileImageUrl;
    [cell.userimage setImageWithURL:[NSURL URLWithString:userimageUrl]];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Private Methods
- (void)onRefresh {
    [self showWithStatus];
    
    
    [[TwitterClient sharedInstance] getHomeTimeLine:^(NSArray *tweets, NSError *error) {
        if(tweets != nil){
            self.tweets = tweets;
            //show Tweets
            NSLog(@"Welcome %lu", tweets.count);
            [self.tweetsview reloadData];
            [self dismissSuccess];
            [self.refreshControl endRefreshing];
        }else {
            //show error view
            [self dismissError];
        }
    }];
}

#pragma mark - Navigation
- (void)showWithStatus {
    [SVProgressHUD showWithStatus:@"Loading"];
}

#pragma mark -
#pragma mark Dismiss Methods Sample

- (void)dismiss {
    [SVProgressHUD dismiss];
}

- (void)dismissSuccess {
    [SVProgressHUD showSuccessWithStatus:@"Loading Complete!"];
}

- (void)dismissError {
    [SVProgressHUD showErrorWithStatus:@"Failed with Error"];
}

- (void)onNewTweet
{
    NSLog(@"New Tweet button clicked");
    ComposeTweetController *cvc = [[ComposeTweetController alloc] init];
    cvc.user = self.currentUser;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:cvc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void) onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTweetController *dvc = [[DetailTweetController alloc] init];
    dvc.currentTweet = self.tweets[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
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
