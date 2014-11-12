//
//  BookDetailViewController.h
//  TextbookExchange
//
//  Created by Haley Elliott on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BookDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleL;
@property (strong, nonatomic) IBOutlet UILabel *authorL;
@property (strong, nonatomic) IBOutlet UILabel *isbnL;
@property (strong, nonatomic) IBOutlet UILabel *ownerL;
@property (strong, nonatomic) IBOutlet UILabel *tpL;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

@property (strong, nonatomic) id detailItem;
@end
