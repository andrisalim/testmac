//
//  Customer.m
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import "Customer.h"

@implementation Customer

-(id) init
{
    self.listPhoneNumber = [[NSMutableArray alloc] init];
    return self;
}
-(id) initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName
{
    self.firstName = firstName;
    self.lastName = lastName;
    self.listPhoneNumber = [[NSMutableArray alloc] init];
    return self;
}

-(void) addPhoneNumber:(PhoneNumber*)phoneNumber
{
    [self.listPhoneNumber addObject:phoneNumber];
}
-(void) addPhoneNumberWithType:(NSString*)type andNumber:(NSString*) number
{
    PhoneNumber *phoneNumber = [[PhoneNumber alloc] init];
    phoneNumber.type = type;
    phoneNumber.number = number;
    
    [self.listPhoneNumber addObject:phoneNumber];
}

@end
