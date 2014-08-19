//
//  CustomerTableViewController.m
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import "CustomerTableViewController.h"
#import "Customer.h"
#import "ProfileViewController.h"

@interface CustomerTableViewController ()

@end

@implementation CustomerTableViewController
@synthesize listCustomer;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewwillappear");
}

- (void)viewDidLoad
{
    NSLog(@"viewdidload");
    [super viewDidLoad];
    listCustomer = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"http://agmostudio.com/training/customer.json"];
    req = [[NSMutableURLRequest alloc] initWithURL:url];
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
    
    if(conn)
        tempData = [NSMutableData data];
    
    /*
    Customer *customer1 = [[Customer alloc] initWithFirstName:@"customer1" andLastName:@"customer1"];
    
    Customer *customer2 = [[Customer alloc] initWithFirstName:@"customer2" andLastName:@"customer2"];
    
    [listCustomer addObject:customer1];
    [listCustomer addObject:customer2];
    [self.tableView reloadData];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listCustomer.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Customer *customer = [listCustomer objectAtIndex:indexPath.row];
    //Customer *customer = listCustomer[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",customer.firstName,customer.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d years old",customer.age];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"profile_segue" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"profile_segue"])
    {
        ProfileViewController *controller = (ProfileViewController*)segue.destinationViewController;
        Customer *selectedCustomer = [listCustomer objectAtIndex:self.selectedIndex];
        
        controller.customer = selectedCustomer;
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Something wrong with the connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [tempData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [tempData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:tempData options:0 error:nil];
    NSArray *arrCustomerData = [dataDict objectForKey:@"data"];
    for(NSDictionary *customerDict in arrCustomerData)
    {
        Customer *customer = [[Customer alloc] init];
        customer.firstName = [customerDict objectForKey:@"firstName"];
        customer.lastName = [customerDict objectForKey:@"lastName"];
        customer.age = [[customerDict objectForKey:@"age"] integerValue];
        customer.imagePath = @"http://kingdom-of-dreams.com/wp-content/uploads/2010/05/binus-university-tampak-luar.png";
        
        Adress *address = [[Adress alloc] init];
        
        NSDictionary *addressDict = [customerDict objectForKey:@"address"];
        address.streetAddress = [addressDict objectForKey:@"streetAddress"];
        address.city= [addressDict objectForKey:@"city"];
        
        customer.address = address;
        
        NSArray *arrPhoneNum = [customerDict objectForKey:@"phoneNumber"];
        for(NSDictionary *phoneNumDict in arrPhoneNum)
        {
            NSString *type = [phoneNumDict objectForKey:@"type"];
            NSString *number = [phoneNumDict objectForKey:@"number"];
            [customer addPhoneNumberWithType:type andNumber:number];
        }
        
        [listCustomer addObject:customer];
    }
    [self.tableView reloadData];
}

@end
