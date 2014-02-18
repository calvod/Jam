//
//  SignUpViewController.h
//  Jam
//
//  Created by Diego Calvo on 2/15/14.
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

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fullNameField;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *companyField;
@property (weak, nonatomic) IBOutlet UITextField *currentTitleField;

- (IBAction)signup:(id)sender;
- (IBAction)cancel:(id)sender;

@end


//there should be a button on the upper left leading back to the login screen, should they change their mind realizing they do have an account