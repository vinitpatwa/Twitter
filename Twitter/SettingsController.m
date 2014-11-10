//
//  SettingsController.m
//  Twitter
//
//  Created by Vinit Patwa on 11/9/14.
//  Copyright (c) 2014 Vinit Patwa. All rights reserved.
//
#import "SettingsController.h"
#import "SettingsCell.h"
#import "TweetsController.h"
#import "UIImageView+AFNetworking.h"

@interface SettingsController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;
@property (weak, nonatomic) IBOutlet UITableView *settnigsView;
@property (strong, nonatomic) NSArray *rowItems;
@end

@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settnigsView.delegate = self;
    self.settnigsView.dataSource = self;
    self.username.text = @"Vinit Patwa"; //self.currentUser.name;
    self.userScreenName.text = @"@vinitpatwa";//[NSString stringWithFormat:@"@%@",self.currentUser.screenname];
   // NSString *userimageUrl = self.currentUser.profileImageUrl;
    [self.userImage setImageWithURL:[NSURL URLWithString:@"http://pbs.twimg.com/profile_images/347990317/Photo0074_normal.jpg"]];
    
    UINib *settingCellNib = [UINib nibWithNibName:@"SettingsCell" bundle:nil];
    [self.settnigsView registerNib:settingCellNib forCellReuseIdentifier:@"SettingsCell"];
    
    self.rowItems = @[@"Home Timeline", @"Mentions", @"Profile"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"row count %ld", [self.rowItems count]);
    return [self.rowItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell" forIndexPath:indexPath];
    // Configure the cell...
    cell.title.text = self.rowItems[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    NSLog(@"index clicked %@", [self.rowItems objectAtIndex:indexPath.row]);
    
    UIViewController *contentvc = nil;
    
    contentvc = [[TweetsController alloc] init];
    
    if (indexPath.row == 1){
        NSLog(@"in here");
        ((TweetsController*)contentvc).mentions = @"yes";
    }
    
    self.hvc.contentViewController = contentvc;
    [self.hvc openMenu];
    
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
