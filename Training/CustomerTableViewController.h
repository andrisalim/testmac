//
//  CustomerTableViewController.h
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTableViewController : UITableViewController<NSURLConnectionDataDelegate>
{
    NSMutableArray *listCustomer;
    NSURLConnection *conn;
    NSMutableURLRequest *req;
    NSMutableData *tempData;
}
@property (nonatomic) int selectedIndex;
@property (strong,nonatomic) NSMutableArray *listCustomer;
@end
