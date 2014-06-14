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

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
