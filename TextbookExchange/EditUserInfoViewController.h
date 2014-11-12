//
//  EditUserInfoViewController.h
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 11/2/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@import CoreLocation;

@interface EditUserInfoViewController : UIViewController
//@property NSString* username;
- (IBAction)editInfo:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *resetPasscode;
@property (weak, nonatomic) IBOutlet UITextField *institute;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phone;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property CLLocationManager *locationManager;

@end
