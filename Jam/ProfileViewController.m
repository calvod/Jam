//
//  ProfileViewController.m
//  Hive
//
//  Created by Diego Calvo on 2/17/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    
    PFUser *currentUser = [PFUser currentUser];
    
    self.name.text = [currentUser objectForKey:@"fullname"];
    self.userName.text = [currentUser objectForKey:@"username"];
    self.company.text = [currentUser objectForKey:@"company"];
    self.currentTitle.text = [currentUser objectForKey:@"currenttitle"];
    self.previousTitles.text = [currentUser objectForKey:@"previoustitle"];
    //self.previousTitles.text = [currentUser objectForKey:@"fullname"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)edit:(id)sender {
    [self performSegueWithIdentifier:@"editViewFromProfileView" sender:self];
}

-(IBAction)logout:(id)sender {

    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"log out"];
    [alert setMessage:@"are you sure?"];
    [alert setDelegate:self];
    [alert setCancelButtonIndex:0];
    [alert addButtonWithTitle:@"cancel"];
    [alert addButtonWithTitle:@"log out"];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //if they hit "log out" from the alert
 if (buttonIndex == 1)
    {
        [PFUser logOut];
        //PFUser *currentUser = [PFUser currentUser]; //this will now be nil
        [self performSegueWithIdentifier:@"logInFromProfileView" sender:self];
    }
}

-(IBAction)answer:(id)sender {
    [self performSegueWithIdentifier:@"answerViewFromProfileView" sender:self];
}

-(IBAction)ask:(id)sender {
     [self performSegueWithIdentifier:@"askViewFromProfileView" sender:self];
}

-(IBAction)myQs:(id)sender {
    if ([[[PFInstallation currentInstallation] objectForKey:@"asker"] isEqualToString:[[PFUser currentUser] objectForKey:@"fullname" ]]) {
        [self performSegueWithIdentifier:@"myQsViewFromProfileView" sender:self];
        NSLog(@"This person, %@, asked the current question on the board, since it's the same person as %@", [[PFUser currentUser] objectForKey:@"fullname"], [[PFInstallation currentInstallation] objectForKey:@"asker"]);
    } else {
        [self performSegueWithIdentifier:@"noQsViewFromProfileView" sender:self];
    }
    
}

@end
