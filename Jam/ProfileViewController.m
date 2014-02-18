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
    if (currentUser) {
        // nothing
    } else {
        [self performSegueWithIdentifier:@"logInFromProfileView" sender:self];
    }
    
    self.name.text = [currentUser objectForKey:@"fullname"];
    self.userName.text = [currentUser objectForKey:@"username"];
    self.company.text = [currentUser objectForKey:@"company"];
    self.currentTitle.text = [currentUser objectForKey:@"currenttitle"];
    //self.previousTitles.text = [currentUser objectForKey:@"fullname"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)edit:(id)sender {
    //[self.navigationController pushViewController:[[EditProfileViewController alloc] init] animated:YES];
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
        PFUser *currentUser = [PFUser currentUser]; //this will now be nil
        [self performSegueWithIdentifier:@"logInFromProfileView" sender:self];
    }
}

-(IBAction)answer:(id)sender {
    //[self.navigationController pushViewController:[[AnswerViewController alloc] init] animated:YES];
}

-(IBAction)ask:(id)sender {
    //[self.navigationController pushViewController:[[AskViewController alloc] init] animated:YES];
}


@end
