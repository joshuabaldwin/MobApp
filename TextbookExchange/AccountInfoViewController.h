//
//  AccountInfoViewController.h
//  TextbookExchange
//
//  Created by JINGXIAN FENG on 10/19/14.
//
//

#import <UIKit/UIKit.h>

@interface AccountInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *institute;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UILabel *welcome;

- (IBAction)logOut:(id)sender;

//@property NSString* username;

@end
