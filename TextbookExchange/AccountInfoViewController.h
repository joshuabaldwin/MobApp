//
//  AccountInfoViewController.h
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/19/14.
//
//

#import <UIKit/UIKit.h>

@import CoreLocation;

@interface AccountInfoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *institute;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *points;
@property (strong, nonatomic) IBOutlet UILabel *welcome;

- (IBAction)logOut:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property CLLocationManager *locationManager;

@end
