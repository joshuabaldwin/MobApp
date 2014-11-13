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
    
    NSLog(@"AccountInfoViewController: viewDidLoad");
    
    self.view.userInteractionEnabled = true;
}


- (void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    [super viewWillAppear:animated];
    
    // Do any additional setup after loading the view.
    
    NSLog(@"AccountInfoViewController: viewWillAppear");
    
    // Pick up the user Singleton value
    PFUser *user = [PFUser currentUser];
    
    self.welcome.text = [NSString stringWithFormat:@"Welcome, %@!", user.username];
    
    self.institute.text = user[@"institute"];
    self.phone.text = user[@"phone"];
    self.name.text = user[@"name"];
    self.email.text = user[@"email"];
    self.points.text = [NSString stringWithFormat:@"%@", user[@"points"]];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
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
//    NSLog(@"Latitude  = %@", [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude]);
//    NSLog(@"Longitude = %@", [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude]);
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
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
    NSMutableArray *array1 = [[address componentsSeparatedByCharactersInSet:
                               [NSCharacterSet characterSetWithCharactersInString:@"\n"]] mutableCopy];
    
    [array1 removeObject:@""];
    
    if (![array1[0] isEqualToString:@"Label"])
    {
        //        for(int i = 0; i < array1.count; i++)
        //        {
        //            NSLog(@"array1[%i] = %@", i, array1[i]);
        //        }
        
        // Split apart the city, state and zip
        NSMutableArray *array2 = [[array1[1] componentsSeparatedByCharactersInSet:
                                   [NSCharacterSet characterSetWithCharactersInString:@",\n"]] mutableCopy];
        
        [array2 removeObject:@""];
        
        //        for(int i = 0; i < array2.count; i++)
        //        {
        //            NSLog(@"array2[%i] = %@", i, array2[i]);
        //        }
        
        
        NSMutableArray *array3 = [[array2[1] componentsSeparatedByCharactersInSet:
                                   [NSCharacterSet characterSetWithCharactersInString:@" -\n"]] mutableCopy];
        
        [array3 removeObject:@""];
        
        //        for(int i = 0; i < array3.count; i++)
        //        {
        //            NSLog(@"array3[%i] = %@", i, array3[i]);
        //        }
        
        // Log the street address
        //NSLog(@"Street Address = %@", array1[0]);
        NSString *tempStr = [prefs objectForKey:addressStorageKey];
        if (tempStr == nil && tempStr.length <= 0)
        {
            [prefs setObject:array1[0] forKey:addressStorageKey];
        }
        
        // Log the city
        //NSLog(@"City = %@", array2[0]);
        tempStr = [prefs objectForKey:cityStorageKey];
        if (tempStr == nil && tempStr.length <= 0)
        {
            [prefs setObject:array2[0] forKey:cityStorageKey];
        }
        
        // Log the state
        //NSLog(@"State = %@", array3[0]);
        tempStr = [prefs objectForKey:stateStorageKey];
        if (tempStr == nil && tempStr.length <= 0)
        {
            [prefs setObject:array3[0] forKey:stateStorageKey];
        }
        
        // Log the country
        //NSLog(@"Country = %@", array1[2]);
        tempStr = [prefs objectForKey:countryStorageKey];
        if (tempStr == nil && tempStr.length <= 0)
        {
            [prefs setObject:array1[2] forKey:countryStorageKey];
        }
        
        // Log the zipcode
        //NSLog(@"Zipcode = %@", array3[1]);
        tempStr = [prefs objectForKey:zipcodeStorageKey];
        if (tempStr == nil && tempStr.length <= 0)
        {
            [prefs setObject:array3[1] forKey:zipcodeStorageKey];
        }
    }
    else
    {
        NSLog(@"Location data not yet found");
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

- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"logInView" sender:self];
}
@end
