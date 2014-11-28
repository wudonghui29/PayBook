//
//  WheelController.h
//  PayBook
//
//  Created by wudonghui on 11/22/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "BaseController.h"



@class Carousel;
@class WheelsController;

typedef void(^WheelDidTapSwipLeftAtIndexBlockk)(WheelsController* wheel, NSInteger index);
typedef void(^WheelDidSwipRightAtIndexBlockk)(WheelsController* wheel, UISwipeGestureRecognizer* sender);


@interface WheelsController : BaseController 


@property(strong, readonly) Carousel *carousel;
@property(nonatomic, strong) NSArray* wheels;
@property(nonatomic, retain) NSMutableArray* imageArray;


@property(copy) WheelDidTapSwipLeftAtIndexBlockk wheelDidTapSwipLeftBlock;
@property(copy) WheelDidSwipRightAtIndexBlockk wheelDidSwipRightBlock;

@end
