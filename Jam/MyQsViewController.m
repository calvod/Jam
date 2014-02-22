//
//  MyQsViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/21/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "MyQsViewController.h"

@interface MyQsViewController ()

@end

@implementation MyQsViewController

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
    [self performSegueWithIdentifier:@"profileViewFromMyQsView" sender:self];
}

-(IBAction)ask:(id)sender {
    [self performSegueWithIdentifier:@"askViewFromMyQsView" sender:self];

}

-(IBAction)answer:(id)sender {
    [self performSegueWithIdentifier:@"answerViewFromMyQsView" sender:self];

}

-(IBAction)thanks:(id)sender {
    //do the thanks thing

}

-(IBAction)followup:(id)sender {
    [self performSegueWithIdentifier:@"followUpViewFromMyQsView" sender:self];

}

@end
