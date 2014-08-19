//
//  ProfileViewController.h
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface ProfileViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblProfile;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) Customer *customer;


@end
