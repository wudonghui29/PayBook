//
//  FinanceKeepingAccount.h
//  PayBook
//
//  Created by isaacs on 11/29/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FinanceKeepingAccount : NSManagedObject

@property (nonatomic, retain) NSString * identification;
@property (nonatomic, retain) NSString * account;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * balance;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSString * remark;
@property (nonatomic, retain) NSString * imageName;

@end
