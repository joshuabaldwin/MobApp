//
//  ViewController.m
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/1/14.
//
//

#import "ViewController.h"
#import "AccountInfoViewController.h"
#import "EditUserInfoViewController.h"

@interface ViewController ()
@property UIAlertView *alert;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.userInteractionEnabled = true;
    
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Textbooks"]]];
    
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];*/

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AccountInfoViewController *viewController1 = segue.destinationViewController;
    EditUserInfoViewController *viewController2 = segue.destinationViewController;
    viewController1.username = self.username.text;
    viewController2.username = self.username.text;
    
    [PFUser currentUser];
}
*/

- (IBAction)logIn:(id)sender {
    [PFUser logInWithUsernameInBackground:_username.text password:_passcode.text block:^(PFUser *user, NSError *error) {
        if (user)
        {
            // Do stuff after successful login.
            //AccountInfoViewController *viewController = [[AccountInfoViewController alloc] init];
            
            //[self.navigationController pushViewController:viewController animated:YES];
            [self performSegueWithIdentifier:@"AccountInfo" sender:self];
        }
        else
        {
            // The login failed. Check error to see why.
            self.alert = [[UIAlertView alloc] initWithTitle:@"Invalid Log-in!" message:@"Incorrect username or passcode." delegate:self cancelButtonTitle:@"Back" otherButtonTitles:nil];
            [self.alert show];
        }
    }];
}


@end
