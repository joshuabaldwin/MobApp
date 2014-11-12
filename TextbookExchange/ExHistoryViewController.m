//
//  ExHistoryViewController.m
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 11/5/14.
//
//

#import "ExHistoryViewController.h"
#import <Parse/Parse.h>

@interface ExHistoryViewController ()

@property NSMutableArray *books;

@end

@implementation ExHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialized the booklist and find current user
    self.books = [[NSMutableArray alloc] init];
    PFUser *user = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Books"];
    [query whereKey:@"ownerID" equalTo:user.username];
    [query whereKey:@"exchanged" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The exchanged books find succeeded
            NSLog(@"Successfully retrieved %lu exchanged books.", (unsigned long)objects.count);
            // Store the found objects to array books
            for (PFObject *object in objects) {
                [self.books addObject:object];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        [self.exchangedBooks reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.books.count;
}

- (UITableViewCell*) tableView:(UITableView *)exchangedBooks cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [exchangedBooks dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.font = [UIFont systemFontOfSize:10];
    PFObject *temp = self.books[indexPath.row];
    NSString *tempStr = [NSString stringWithFormat:@"%@", temp[@"author"]];
    cell.textLabel.text = tempStr;
    return cell;
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

@end
