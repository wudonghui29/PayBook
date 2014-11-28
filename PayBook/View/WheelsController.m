//
//  WheelController.m
//  PayBook
//
//  Created by wudonghui on 11/22/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "WheelsController.h"
#import "ClassesInterface.h"    


@interface WheelsController() <iCarouselDataSource,iCarouselDelegate>

@end

@implementation WheelsController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    swipeGesture.delegate = (id <UIGestureRecognizerDelegate>)self;
    [self.view  addGestureRecognizer:swipeGesture];
    _carousel = [[Carousel alloc] initWithFrame: self.view.bounds];
    _carousel.backgroundColor = [UIColor clearColor];
    _carousel.dataSource = self;
    _carousel.delegate = self;
    _carousel.type = iCarouselTypeRotary;
    _carousel.vertical = YES;
    [self.view addSubview: _carousel];
    
}

- (UIViewController *)viewController1
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    
    return viewController;
}

-(void)didSwipeRight:(id)sender
{
    if (self.wheelDidSwipRightBlock) {
        self.wheelDidSwipRightBlock(self, sender);
    } else {
    
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void) didTapOrSwipeLeftCarouselItemAtIndex:(NSInteger)index {
    
    if (self.wheelDidTapSwipLeftBlock) self.wheelDidTapSwipLeftBlock(self, index);
}




- (NSUInteger)numberOfItemsInCarousel:(Carousel *)carousel
{
    return self.wheels.count;
}

- (UIView *)carousel:(Carousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    NSString *imageStr = [self.imageArray safeObjectAtIndex:index];
    UIImage* image = [UIImage imageNamed:imageStr];
    
    CGRect rect = CanvasRect(0, 0, 600, 250);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    UIView *view1 = [[UIView alloc] initWithFrame: rect];
    [ColorHelper setBorder: view1];
    imageView.image = image;
    [view1 addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    NSString *str = [self.wheels safeObjectAtIndex:index];
    label.text = str;
    label.textAlignment = YES;
    [imageView addSubview:label];
    // set the localize
    
    
    return view1;
}

- (void)carousel:(Carousel *)carousel didTapItemAtIndex:(NSInteger)index {
    
    [self didTapOrSwipeLeftCarouselItemAtIndex: index];
}

- (void)carousel:(Carousel *)carousel didSwipeItemAtIndex:(NSInteger)index {
    [self didTapOrSwipeLeftCarouselItemAtIndex: index];
}


- (CGFloat)carouselItemWidth:(Carousel *)carousel
{
    return CanvasW(600);
}



@end
