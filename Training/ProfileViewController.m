//
//  ProfileViewController.m
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import "ProfileViewController.h"
#import "Adress.h"
#import "PhoneNumber.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

UIImageView *imageView;

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
    
    Adress *address = self.customer.address;
    PhoneNumber *phoneNum = self.customer.listPhoneNumber[0];
    
    NSString *strAddress = [NSString stringWithFormat:@"%@ %@",address.streetAddress, address.city];
    NSString *strPhoneNum = [NSString stringWithFormat:@"%@ - %@",phoneNum.type,phoneNum.number];

    self.lblProfile.text = [NSString stringWithFormat:
                            @"Age :%d\n"
                            @"Address: %@\n"
                            @"PhoneNumber: %@",
                            self.customer.age,
                            strAddress,
                            strPhoneNum
                            ];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@",self.customer.firstName,self.customer.lastName ];
    
    NSURL *url = [NSURL URLWithString:self.customer.imagePath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize = image.size;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 4.0;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
