//
//  RainDetailViewController.m
//  GirlOfTheWilds
//
//  Created by Phuong Nguyen on 6/14/14.
//  Copyright (c) 2014 Superrain. All rights reserved.
//

#import "RainDetailViewController.h"
#import "InfoViewController.h"
@interface RainDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation RainDetailViewController
@synthesize img1;
NSString *title1;
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (IBAction)nextSwipe:(UISwipeGestureRecognizer *)recognizer{
    
    if(self.CurrentIndex<[self.allLines count])
        self.CurrentIndex++;
    [self LoadImageFromURL:[self.allLines objectAtIndex:self.CurrentIndex]];
    
    
}
- (IBAction)previousSwipe:(UISwipeGestureRecognizer *)recognizer{
    
    if(self.CurrentIndex>0)
        self.CurrentIndex--;
    [self LoadImageFromURL:[self.allLines objectAtIndex:self.CurrentIndex]];
    
    
}
- (IBAction)getInfo:(UIBarButtonItem *)sender
{
    InfoViewController    *detail=[[InfoViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        
       
        //my
        NSString *MainURL=@"http://fataco.com/truyen/truyena/";
        NSString *rowValue = [self.detailItem description];
        NSArray *arrayTitle=[rowValue componentsSeparatedByString: @"|||"];
        NSString *FullURL = [MainURL stringByAppendingString: [arrayTitle objectAtIndex:0]];
        title1=[arrayTitle objectAtIndex:1];
        title1=[title1 stringByReplacingOccurrencesOfString:@"\r"
                                             withString:@""];
        NSString *temp1=[NSString stringWithFormat:@"(%d/%d)",self.CurrentIndex+1,self.allLines.count];
        self.title= [title1 stringByAppendingString:temp1 ];
        self.MainURL=[FullURL stringByReplacingOccurrencesOfString:@"\r"
                                                        withString:@""];
        //load array of images for detail
        NSURL *URL = [NSURL URLWithString:self.MainURL];
        NSError *error;
        NSString *stringFromFileAtURL = [[NSString alloc]
                                         initWithContentsOfURL:URL
                                         encoding:NSUTF8StringEncoding
                                         error:&error];
        NSArray *allLines2 = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
        self.allLines=allLines2;
        
        //end my
        [self LoadImageFromURL:[self.allLines objectAtIndex:self.CurrentIndex]];
    }
}
-(void)LoadImageFromURL:(NSString *)path
{
    //img1.image=[UIImage imageNamed:@"loading1.gif"];
    path=[path stringByReplacingOccurrencesOfString:@"\r"
                                         withString:@""];
    NSString *temp=[self.MainURL stringByReplacingOccurrencesOfString:@".txt"
                                                           withString:@"/"];
    path=[temp stringByAppendingString:path];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
    if(image!=NULL)
        img1.image=image;
    
    
    NSString *temp1=[NSString stringWithFormat:@"(%d/%d)",self.CurrentIndex+1,self.allLines.count];
    self.title= [title1 stringByAppendingString:temp1 ];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
