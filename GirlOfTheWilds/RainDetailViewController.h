//
//  RainDetailViewController.h
//  GirlOfTheWilds
//
//  Created by Phuong Nguyen on 6/14/14.
//  Copyright (c) 2014 Superrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RainDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic,retain) IBOutlet UIImageView *img1;

//@property (nonatomic,retain) IBOutlet UISwipeGestureRecognizer *swipe1;
- (IBAction)nextSwipe:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)previousSwipe:(UISwipeGestureRecognizer *)recognizer;

@property(retain, nonatomic, readwrite) NSString *MainURL;
@property(retain, nonatomic, readwrite) NSArray *allLines;
@property int CurrentIndex;
- (IBAction)getInfo:(UIBarButtonItem *)sender;

@end
