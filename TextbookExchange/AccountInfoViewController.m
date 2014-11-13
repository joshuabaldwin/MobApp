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
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
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

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //self.latitudeLabel.text = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    //self.longitudeLabel.text = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks && placemarks.count > 0)
        {
            CLPlacemark *placemark = placemarks[0];
            self.addressLabel.text = [[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] componentsJoinedByString:@"\n"];
            
            // Store text of the label into NSUserDefault fullAddressStorageKey
            NSUserDefaults *prefs = [[NSUserDefaults alloc] init];
            [prefs setObject:self.addressLabel.text forKey:fullAddressStorageKey];
        }
    }];
    
    // Parse the address
    // Step 1: Split string value stored in fullAddressStorageKey into array of three strings splitting on /n character
    // Print the array into the log
    // Array[1] should be the address
    // Array[2] will need to be split on , and space to separate into city, state, and zipcode
    
    NSUserDefaults *prefs = [[NSUserDefaults alloc] init];
    
    NSString *address = self.addressLabel.text;
    NSArray *array1 = [address componentsSeparatedByCharactersInSet:
                       [NSCharacterSet characterSetWithCharactersInString:@"\n"]];//[address componentsSeparatedByString:@"\n"];
    
    for(int i = 0; i < array1.count; i++)
    {
        NSLog(@"array[%i] = %@", i, array1[i]);
    }
    
    // Log the street address
    
    
    // Split apart the city, state and zip
    //NSArray *array2 = [whicheverIsCorrectStringFromArray1 componentsSeparatedByCharactersInSet:
    //                   [NSCharacterSet characterSetWithCharactersInString:@", -\n"]];//[address componentsSeparatedByString:@"\n"];
    
    // Log the city
    
    
    // Log the state
    
    
    // Log the zipcode
    
    
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
