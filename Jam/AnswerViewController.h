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
@property (strong, nonatomic) IBOutlet UITextField *answer;
@property (strong, nonatomic) IBOutlet UILabel *askerName;
@property (strong, nonatomic) IBOutlet UILabel *askerCurrentTitle;

-(IBAction)answer:(id)sender;
-(IBAction)me:(id)sender;
-(IBAction)ask:(id)sender;
-(IBAction)myQs:(id)sender;

@end
