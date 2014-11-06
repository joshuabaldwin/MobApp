//
//  EditBookViewController.h
//  TextbookExchange
//
//  Created by Haley Elliott on 11/5/14.
//
//

#import <UIKit/UIKit.h>

@interface EditBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *ExchangeButt;
@property (weak, nonatomic) IBOutlet UITextField *titleLBL;
@property (weak, nonatomic) IBOutlet UITextField *authorLBL;
@property (weak, nonatomic) IBOutlet UITextField *isbnLBL;

@end
