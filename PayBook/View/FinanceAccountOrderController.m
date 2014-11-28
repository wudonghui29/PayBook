//
//  FinanceAccountOrderController.m
//  PayBook
//
//  Created by wudonghui on 11/25/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "FinanceAccountOrderController.h"
#import "JRComponents.h"

@interface FinanceAccountOrderController ()

@end

@implementation FinanceAccountOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    NSDictionary* specification = [JsonFileManager getJsonFromFile:@"FinanceAccount.json"];
    JsonView* jsonview = (JsonView*)[JsonViewRenderHelper render:@"" specifications: specification];
    [self.view addSubview: jsonview];
    
    
    JRButton* backButton = (JRButton *)[jsonview getView:@"BTN_Back"];
    backButton.didClikcButtonAction = ^void(JRButton* btn) {
        [self.navigationController popViewControllerAnimated: YES];
    };
}



@end
