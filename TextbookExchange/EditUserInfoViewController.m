//
//  EditUserInfoViewController.m
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 11/2/14.
//
//

#import "EditUserInfoViewController.h"

@interface EditUserInfoViewController ()

@end

@implementation EditUserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
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
            //self.addressLabel.text = [[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] componentsJoinedByString:@"\n"];
        }
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.userInteractionEnabled = true;
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

- (IBAction)editInfo:(id)sender {
    // Authorize the current user to modify the user info
    PFUser *user = [PFUser currentUser];
    
    // Determine if each info's existence
    // Cannot give a property a name that begins with new or copy.
    if ([_resetPasscode.text length] != 0)
    {
        user.password = _resetPasscode.text;
    }
    if ([_institute.text length] != 0)
    {
        user[@"institute"] = _institute.text;
    }
    if ([_name.text length] != 0)
    {
        user[@"name"] = _name.text;
    }
    if ([_email.text length] != 0)
    {
        user.email = _email.text;
    }
    if ([_phone.text length] != 0)
    {
        user[@"phone"] = _phone.text;
    }
    
    // Finish editing and go back the Account Info view
    [user save];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
