//
//  FinanceAccountOrderController.m
//  PayBook
//
//  Created by wudonghui on 11/25/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "FinanceAccountOrderController.h"
#import "ClassesInterface.h"

@interface FinanceAccountOrderController ()

@end

@implementation FinanceAccountOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    NSDictionary* specification = [JsonFileManager getJsonFromFile:@"FinanceAccount.json"];
    JsonView* jsonview = (JsonView*)[JsonViewRenderHelper render:@"" specifications: specification];
    [self.view addSubview: jsonview];
    JRTextField *accountName = ((JRLabelTextFieldView *)[jsonview getView:@"accountName"]).textField;
    [accountName setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *currency = ((JRLabelTextFieldView *)[jsonview getView:@"currency"]).textField;
    [currency setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *amount = ((JRLabelTextFieldView *)[jsonview getView:@"amount"]).textField;
    [amount setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *bankName = ((JRLabelTextFieldView *)[jsonview getView:@"bankName"]).textField;
    [bankName setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *branchOffice = ((JRLabelTextFieldView *)[jsonview getView:@"branchOffice"]).textField;
    [branchOffice setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *bankAccountName = ((JRLabelTextFieldView *)[jsonview getView:@"bankAccountName"]).textField;
    [bankAccountName setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *bankAccountNumber = ((JRLabelTextFieldView *)[jsonview getView:@"bankAccountNumber"]).textField;
    [bankAccountNumber setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];

    
    JRButton* backButton = (JRButton *)[jsonview getView:@"BTN_Back"];
    backButton.didClikcButtonAction = ^void(JRButton* btn) {
        [self.navigationController popViewControllerAnimated: YES];
    };
    JRButton *saveButton = (JRButton *)[jsonview getView:@"BTN_Save"];
    saveButton.didClikcButtonAction = ^void(JRButton *sender){
        NSDictionary *models = [jsonview getModel];
        NSMutableDictionary *values = [DictionaryHelper deepCopy:models];
        NSString* identification = [DateHelper stringFromDate:[NSDate date] pattern:@"yyyyMMddHHmmss"];
        [values setObject: identification forKey:@"identification"];
        if(values[@"amount"])
        {
            NSString *amountString = values[@"amount"];
            float amountFloat = [amountString floatValue];
            NSNumber *amountNumber = [NSNumber numberWithFloat:amountFloat];
            [values setObject:amountNumber forKey:@"amount"];
        }
        [MODELS save:values entityName:@"FinanceAccount"];

    };

}
@end
