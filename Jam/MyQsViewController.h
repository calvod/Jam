//
//  MyQsViewController.h
//  Jam
//
//  Created by Diego Calvo on 2/21/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MyQsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutlet UILabel *answer;
@property (strong, nonatomic) IBOutlet UILabel *answererName;
@property (strong, nonatomic) IBOutlet UILabel *answererCurrentTitle;

-(IBAction)me:(id)sender;
-(IBAction)ask:(id)sender;
-(IBAction)answer:(id)sender;
-(IBAction)thanks:(id)sender;
-(IBAction)followup:(id)sender;

@end
