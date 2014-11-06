//
//  ViewController.h
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/1/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passcode;
- (IBAction)logIn:(id)sender;

@end
