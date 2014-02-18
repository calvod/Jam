//
//  EditProfileViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/15/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[[PFUser currentUser] objectForKey:@"fullname"] length] > 0) {
        self.fullNameField.placeholder = [[PFUser currentUser] objectForKey:@"fullname"];
    } else {
        self.fullNameField.placeholder = @"full name";
    }
    if ([[[PFUser currentUser] objectForKey:@"username"] length] > 0) {
        self.userNameField.placeholder = [[PFUser currentUser] objectForKey:@"username"];
    } else {
        self.userNameField.placeholder = @"username";
    }
    if ([[[PFUser currentUser] objectForKey:@"email"] length] > 0) {
        self.emailField.placeholder = [[PFUser currentUser] objectForKey:@"email"];
    } else {
        self.emailField.placeholder = @"email";
    }
    if ([[[PFUser currentUser] objectForKey:@"company"] length] > 0) {
        self.companyField.placeholder = [[PFUser currentUser] objectForKey:@"company"];
    } else {
        self.companyField.placeholder = @"company";
    }
    if ([[[PFUser currentUser] objectForKey:@"currenttitle"] length] > 0) {
        self.currentTitleField.placeholder = [[PFUser currentUser] objectForKey:@"currenttitle"];
    } else {
        self.currentTitleField.placeholder = @"current title";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    if (self.fullNameField.text.length > 0) {
        [[PFUser currentUser] setObject:self.fullNameField.text forKey:@"fullname"];
    }
    if (self.userNameField.text.length > 0) {
        [[PFUser currentUser] setObject:self.userNameField.text forKey:@"username"];
    }
    if (self.emailField.text.length > 0) {
        [[PFUser currentUser] setObject:self.emailField.text forKey:@"email"];
    }
    if (self.companyField.text.length > 0) {
        [[PFUser currentUser] setObject:self.companyField.text forKey:@"company"];
    }
    if (self.currentTitleField.text.length > 0) {
        [[PFUser currentUser] setObject:self.currentTitleField.text forKey:@"currenttitle"];
    }
    
    [[PFUser currentUser] saveInBackground];
    [self performSegueWithIdentifier:@"profileViewFromEditView" sender:self];
}
- (IBAction)cancel:(id)sender {
    [self performSegueWithIdentifier:@"profileViewFromEditView" sender:self];
}

@end
