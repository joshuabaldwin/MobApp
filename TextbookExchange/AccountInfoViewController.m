//
//  AccountInfoViewController.m
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/19/14.
//
//

#import "AccountInfoViewController.h"
#import <Parse/Parse.h>

@interface AccountInfoViewController ()

@end



@implementation AccountInfoViewController

//@synthesize username;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.userInteractionEnabled = true;
}

- (void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.
    PFUser *user = [PFUser currentUser];
    
    self.welcome.text = [NSString stringWithFormat:@"Welcome, %@!", user.username];
    
    self.institute.text = user[@"institute"];
    self.phone.text = user[@"phone"];
    self.name.text = user[@"name"];
    self.email.text = user[@"email"];
    self.points.text = [NSString stringWithFormat:@"%@", user[@"points"]];
    
    /*
    //query the parse using username
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"username" equalTo:self.username];
    */
    /*
    // Query the parse using username
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:self.username];
    
    // Access the table "User" from parse.com
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        
        PFObject *user = [users objectAtIndex:0];
        
        // Display account infomation here
        self.institute.text = user[@"institute"];
        self.phone.text = user[@"phone"];
        self.name.text = user[@"name"];
        self.email.text = user[@"email"];
    }];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"logInView" sender:self];
}
@end
