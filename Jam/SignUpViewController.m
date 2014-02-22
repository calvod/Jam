//
//  SignUpViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/17/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signup:(id)sender {
    NSString *fullname = [self.fullNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *username = [self.userNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *company = [self.companyField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *currenttitle = [self.currentTitleField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *previoustitle = [self.previousTitleField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    if ([fullname length] == 0 || [username length] == 0 || [password length] == 0 || [email length] == 0 || [company length] == 0 || [currenttitle length] == 0 || [previoustitle length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"oops" message:@"make sure you enter all fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    } else {
        PFUser *newUser = [PFUser user];
        [newUser setObject:fullname forKey:@"fullname"];
        [newUser setObject:username forKey:@"username"];
        newUser.password = password;
        [newUser setObject:email forKey:@"email"];
        [newUser setObject:company forKey:@"company"];
        [newUser setObject:currenttitle forKey:@"currenttitle"];
        [newUser setObject:previoustitle forKey:@"previoustitle"];
        [newUser setObject:@"" forKey:@"myquestion"];
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Hooray! Let them use the app now.
                [self performSegueWithIdentifier:@"profileViewFromSignUp" sender:self];
            } else {
                //NSString *errorString = [error userInfo][@"error"];
                // Show the errorString somewhere and let the user try again.
                NSLog(@"Error while signing up");
            }
        }];
        

        //subscribe to receive push notifications for it's previous title and current title
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation addUniqueObject:[newUser objectForKey:@"currenttitle"] forKey:@"channels"];
        [currentInstallation addUniqueObject:[newUser objectForKey:@"previoustitle"] forKey:@"channels"];
        [currentInstallation saveInBackground];
    }
}

- (IBAction)cancel:(id)sender {
    [self performSegueWithIdentifier:@"logInFromSignUp" sender:self];
}

@end
