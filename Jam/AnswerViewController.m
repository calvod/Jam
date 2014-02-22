//
//  AnswerViewController.m
//  Jam
//
//  Created by Diego Calvo on 2/21/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

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
    self.question.text = [[PFInstallation currentInstallation] objectForKey:@"question"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)answer:(id)sender {
    NSLog(@"Shot the answer back");
}

-(IBAction)me:(id)sender {
    [self performSegueWithIdentifier:@"profileViewFromAnswerView" sender:self];
}

-(IBAction)ask:(id)sender {
    [self performSegueWithIdentifier:@"askViewFromAnswerView" sender:self];
}

@end
