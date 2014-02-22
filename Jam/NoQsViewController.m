//
//  NoQsViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/22/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "NoQsViewController.h"

@interface NoQsViewController ()

@end

@implementation NoQsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)me:(id)sender {
    [self performSegueWithIdentifier:@"profileViewFromNoQsView" sender:self];
}

-(IBAction)ask:(id)sender {
    [self performSegueWithIdentifier:@"askViewFromNoQsView" sender:self];
}

-(IBAction)answer:(id)sender {
    [self performSegueWithIdentifier:@"answerViewFromNoQsView" sender:self];
}

@end
