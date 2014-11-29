//
//  FinanceAccount.h
//  PayBook
//
//  Created by isaacs on 11/29/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FinanceAccount : NSManagedObject

@property (nonatomic, retain) NSString * accountName;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * bankAccountName;
@property (nonatomic, retain) NSString * bankAccountNumber;
@property (nonatomic, retain) NSString * bankName;
@property (nonatomic, retain) NSString * branchOffice;
@property (nonatomic, retain) NSString * currency;

@end
