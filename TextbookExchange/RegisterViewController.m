//
//  RegisterViewController.m
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/19/14.
//
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()
@property UIAlertView *alert;

@end

@implementation RegisterViewController



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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)registerUser:(id)sender
{
    if ([_username.text length] != 0 && [_passcode.text length] != 0 && [_email.text length] != 0) {
        // Once user clicks on register
        PFUser *user = [PFUser user];
        
        NSLog(@"Username  = %@", self.username.text);
        NSLog(@"Password  = %@", self.passcode.text);
        NSLog(@"Institute = %@", self.institute.text);
        NSLog(@"Name      = %@", self.name.text);
        NSLog(@"Email     = %@", self.email.text);
        NSLog(@"Phone     = %@", self.phone.text);
        
        user.username = self.username.text;
        user.password = self.passcode.text;
        user[@"institute"] = self.institute.text;
        user[@"name"] = self.name.text;
        user.email = self.email.text;
        user[@"phone"] = self.phone.text;
        user[@"points"] = 0;
        
        // This call will asynchronously create a new user in Parse App.
        // It also will make sure both the username and email are unique
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Hooray! Let them use the app now.
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                NSString *errorString = [error userInfo][@"error"];
                // Show the errorString somewhere and let the user try again.
                self.alert = [[UIAlertView alloc]
                              initWithTitle:@"Invalid Register!"
                              message:errorString
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
                [self.alert show];
            }
        }];
    }
    else{
        self.alert = [[UIAlertView alloc]
                      initWithTitle:@"Invalid Register!"
                      message:@"Username, passcode, and email address are required!"
                      delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil];
        [self.alert show];
    }
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

@end
