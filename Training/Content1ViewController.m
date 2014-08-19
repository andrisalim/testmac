//
//  Content1ViewController.m
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import "Content1ViewController.h"

@interface Content1ViewController ()

@end

@implementation Content1ViewController

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
    self.tabBarItem.title = @"ini tab 1";
    self.tabBarItem.badgeValue = @"test";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
