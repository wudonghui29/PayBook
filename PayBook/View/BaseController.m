//
//  BaseController.m
//  PayBook
//
//  Created by wudonghui on 11/21/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "BaseController.h"
#import "ClassesInterface.h"

@implementation BaseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    self.view.backgroundColor = [UIColor grayColor];
   
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
