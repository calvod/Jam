//
//  EditProfileViewController.h
//  Jam
//
//  Created by Diego Calvo on 2/15/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fullNameField;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *companyField;
@property (weak, nonatomic) IBOutlet UITextField *currentTitleField;
@property (weak, nonatomic) IBOutlet UITextField *previousTitle;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
