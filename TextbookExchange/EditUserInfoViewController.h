//
//  EditUserInfoViewController.h
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 11/2/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Constants.h"

@import CoreLocation;

@interface EditUserInfoViewController : UIViewController

- (IBAction)editInfo:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *resetPasscode;
@property (strong, nonatomic) IBOutlet UITextField *institute;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipcodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *countryTextField;

@property CLLocationManager *locationManager;

@end
