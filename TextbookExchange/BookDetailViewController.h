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
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *authorL;
@property (weak, nonatomic) IBOutlet UILabel *isbnL;
@property (weak, nonatomic) IBOutlet UILabel *ownerL;
@property (weak, nonatomic) IBOutlet UILabel *tpL;

@property (strong, nonatomic) id detailItem;
@end
