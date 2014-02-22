//
//  AnswerViewController.h
//  Jam
//
//  Created by Diego Calvo on 2/21/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AnswerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *question;


-(IBAction)answer:(id)sender;

-(IBAction)me:(id)sender;
-(IBAction)ask:(id)sender;
-(IBAction)myQs:(id)sender;

@end
