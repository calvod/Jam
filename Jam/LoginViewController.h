//
//  LoginViewController.h
//  Hive
//
//  Created by Diego Calvo on 2/16/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
//#import "ProfileViewController.h"
//#import "EditProfileViewController.h"
//#import "AnswerViewController.h"
//#import "AskViewController.h"
//#import "LoginViewController.h"
//#import "SignUpViewController.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)login:(id)sender;
- (IBAction)signup:(id)sender;

@end
