//
//  LoadViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/21/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "LoadViewController.h"

@interface LoadViewController ()

@end

@implementation LoadViewController

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
	// Do any additional setup after loading the view.
    [[PFUser currentUser] refresh];
}

-(void)hive:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        [self performSegueWithIdentifier:@"profileViewFromLoadView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"logInViewFromLoadView" sender:self];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
