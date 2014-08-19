//
//  ViewController.m
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize attemptCount;
//@synthesize attemptCount = _attemptCount;

/*
-(void)setAttemptCount:(int)attemptCount
{
    _attemptCount = attemptCount;
}

-(int)attemptCount
{
    return _attemptCount;
}
*/
- (void)viewDidLoad
{
    attemptCount = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin_TouchUpInside:(id)sender {
    BOOL success = [self authenticateUserWithUsername:self.txtUsername.text andPassword:self.txtPassword.text];
    if(true)
    {
        [self performSegueWithIdentifier:@"customer_segue" sender:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid username or password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        //alert.delegate = self;
        
        [alert show];
        attemptCount++;
        self.lblAttemptCount.text = [NSString stringWithFormat:@"Login attempt: %d",attemptCount ];
    }
}

-(BOOL)authenticateUserWithUsername: (NSString*) username andPassword: (NSString*) password
{
    if([username isEqualToString:@"admin"] && [password isEqualToString:@"admin"])
        return YES;
    else
        return NO;
}

- (IBAction)dismissKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)dismissAllKeyboard:(id)sender {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",buttonIndex);
}

@end
