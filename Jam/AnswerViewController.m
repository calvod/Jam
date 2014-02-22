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
    self.askerName.text = [[PFInstallation currentInstallation] objectForKey:@"asker"];
    self.askerCurrentTitle.text = [[PFInstallation currentInstallation] objectForKey:@"askerCurrentTitle"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//make keyboard get out of the way
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.answer resignFirstResponder];
}

-(IBAction)answer:(id)sender {
    NSLog(@"Shot the answer back");
    PFUser *user = [PFUser currentUser];
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setObject:self.answer.text forKey:@"answer"];
    [currentInstallation setObject:[user objectForKey:@"fullname"] forKey:@"answerer"];
    [currentInstallation setObject:[user objectForKey:@"currenttitle"] forKey:@"answererCurrentTitle"];
    [currentInstallation saveInBackground];
}

-(IBAction)me:(id)sender {
    [self performSegueWithIdentifier:@"profileViewFromAnswerView" sender:self];
}

-(IBAction)ask:(id)sender {
    [self performSegueWithIdentifier:@"askViewFromAnswerView" sender:self];
}

-(IBAction)myQs:(id)sender {
    [self performSegueWithIdentifier:@"myQsViewFromAnswerView" sender:self];
}

@end
