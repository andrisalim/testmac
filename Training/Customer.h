//
//  Customer.h
//  Training
//
//  Created by prk on 7/17/14.
//  Copyright (c) 2014 prk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adress.h"
#import "PhoneNumber.h"

@interface Customer : NSObject
@property(strong,nonatomic) NSString *firstName;
@property(strong,nonatomic) NSString *lastName;
@property(nonatomic) int age;
@property(strong,nonatomic) Adress *address;
@property(strong,nonatomic) NSMutableArray *listPhoneNumber;
@property(strong,nonatomic) NSString *imagePath;

-(id) init;
-(id) initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName;

-(void) addPhoneNumber:(PhoneNumber*)phoneNumber;
-(void) addPhoneNumberWithType:(NSString*)type andNumber:(NSString*) number;
@end
