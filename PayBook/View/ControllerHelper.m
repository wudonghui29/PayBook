//
//  ControllerHelper.m
//  PayBook
//
//  Created by wudonghui on 11/22/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "ControllerHelper.h"

#import "ClassesInterface.h"


@implementation ControllerHelper


+(WheelsController *)baseController1
{
    
    WheelsController *baseController = [[WheelsController alloc] init];
    baseController.wheels = @[@"1",@"2",@"3"];
    baseController.imageArray =  @[@"a.png",@"b.png",@"c.png"];
    return baseController;
}


@end
