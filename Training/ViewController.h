//
//  ViewController.h
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    int attemptCount;
}

@property(nonatomic) int attemptCount;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblAttemptCount;
- (IBAction)btnLogin_TouchUpInside:(id)sender;
-(BOOL)authenticateUserWithUsername: (NSString*) username andPassword: (NSString*) password;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)dismissAllKeyboard:(id)sender;

@end
