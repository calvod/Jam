//
//  AskViewController.m
//  Hive
//
//  Created by Diego Calvo on 2/17/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "AskViewController.h"

@interface AskViewController ()

@end

@implementation AskViewController

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

-(IBAction)ask:(id)sender {
    
//    // Create our Installation query
//    PFQuery *pushQuery = [PFInstallation query];
//    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
//    
//    // Send push notification to query
//    [PFPush sendPushMessageToQueryInBackground:pushQuery
//                                   withMessage:self.question.text];
    
    // Send a notification to all devices subscribed to the previoustitle and currenttitle channel.
    PFUser *user = [PFUser currentUser];
    NSArray *channels = [NSArray arrayWithObjects:[user objectForKey:@"currenttitle"], [user objectForKey:@"previoustitle"], nil];
    
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          self.question.text, @"alert",
                          @"Increment", @"badge",
                          @"pop.m4a", @"sound",
                          nil];
    PFPush *push = [[PFPush alloc] init];
    [push setChannels:channels];
    [push setData:data];
    [push sendPushInBackground];
    
    //YOLO around it for now
    [[PFInstallation currentInstallation] setObject:self.question.text forKey:@"question"];
    //[[PFInstallation currentInstallation] setObject:FALSE forKey:@"answered"];
    
    [self performSegueWithIdentifier:@"profileViewFromAskView" sender:self];
    
    NSLog(@"Question shot");
}

-(IBAction)answer:(id)sender {
    //segue to answer view controller
    [self performSegueWithIdentifier:@"answerViewFromAskView" sender:self];
}

-(IBAction)me:(id)sender {
    [self performSegueWithIdentifier:@"profileViewFromAskView" sender:self];
}

- (void)askQuestion
{
    
}

@end