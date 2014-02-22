//
//  AskViewController.h
//  Jam
//
//  Created by Diego Calvo on 2/15/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *question;

-(IBAction)ask:(id)sender;
-(IBAction)answer:(id)sender;
-(IBAction)me:(id)sender;
-(IBAction)myQs:(id)sender;

@end
