//
//  AppDelegate.m
//  PayBook
//
//  Created by wudonghui on 11/21/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "AppDelegate.h"
#import "ClassesInterface.h"

@interface AppDelegate ()
{
    BOOL isLanguageSet;
    NSString *_languageSelected;
    UINavigationController *nav;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];

    [FrameTranslater setCanvasSize: CGSizeMake(768, 1331.25)];
    [KeyBoardHelper sharedInstance].keyboardDistanceFromTextField = CanvasH(10);
    
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES withAnimation:UIStatusBarAnimationFade];
    
    
    WheelsController *secondController = [[WheelsController alloc] init];
    __block WheelsController *blockSecondController = secondController;

    [CategoriesLocalizer setCurrentLanguage: [[NSUserDefaults standardUserDefaults] objectForKey: PREFERENCE_LANGUAGE]];
    isLanguageSet = NO;
    
    WheelsController* mainController = [[WheelsController alloc] init];
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController: mainController];
    self.window.rootViewController = navController;
    nav =navController;
    __block WheelsController *blockm = mainController;
    mainController.wheels = [NSArray arrayWithObjects:LOCALIZE_KEY(@"payment"),LOCALIZE_KEY(@"receiptMoney"),LOCALIZE_KEY(@"check"),LOCALIZE_KEY(@"analyze"),LOCALIZE_KEY(@"setting"), nil];
    NSMutableArray* wheelsImages = [[NSArray arrayWithObjects:@"Wheel_1",@"Wheel_2",@"Wheel_3",@"Wheel_4",@"Wheel_5", nil] mutableCopy];
    mainController.imageArray = wheelsImages;
    
    mainController.wheelDidTapSwipLeftBlock = ^(WheelsController *baseController , NSInteger index){

        WheelsController *secondController = [[WheelsController alloc] init];
        secondController.wheels = @[LOCALIZE_KEY(@"cash"), LOCALIZE_KEY(@"account"),LOCALIZE_KEY(@"bankcard")];
        secondController.imageArray = wheelsImages;
        [secondController.imageArray addObject:@"Wheel_6"];
        secondController.wheelDidTapSwipLeftBlock = ^(WheelsController *baseController , NSInteger index){
            WheelsController* threeController = [ControllerHelper baseController1];
            
            threeController.wheels = @[LOCALIZE_KEY(@"clothes"),LOCALIZE_KEY(@"food"),LOCALIZE_KEY(@"living"),LOCALIZE_KEY(@"behaviour"), LOCALIZE_KEY(@"entertainment"), LOCALIZE_KEY(@"sports")];
            threeController.imageArray = wheelsImages;
            
            threeController.wheelDidTapSwipLeftBlock = ^(WheelsController *wheelController,NSInteger index){
                FinanceKeepingAccountViewController *keepingAccountViewController = [[FinanceKeepingAccountViewController alloc] init];
                [navController pushViewController:keepingAccountViewController animated:YES];
            };
            if(index == 0)
            {
                if(isLanguageSet)
                {
                    NSArray* localizeLanguages = [LocalizeHelper localize: LANGUAGES];
                    [PopupViewHelper popSheet: LOCALIZE_KEY(@"SelectALanguage") inView:[ViewHelper getTopView] actionBlock:^(UIView *popView, NSInteger index) {
                    if (index >= 0 && index < LANGUAGES.count) {
                        NSString* languageSelected = LANGUAGES[index];
                        _languageSelected =languageSelected;
                        // Set Preference Language
                        [[NSUserDefaults standardUserDefaults] setObject: languageSelected forKey: PREFERENCE_LANGUAGE];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        
                        [CategoriesLocalizer setCurrentLanguage: languageSelected];
                        secondController.wheels = @[LOCALIZE_KEY(@"languagesetting")];
                        secondController.imageArray = @[@"a.png"];
                        [secondController.carousel reloadData];
                        
                    }
                } buttonTitles: localizeLanguages];
                    
                }
                else [navController pushViewController:threeController animated:YES];
                
            } else if(index == 1)
            {
        
                [navController pushViewController:threeController animated:YES];
                
            } else  if(index == 2)
            {

                [navController pushViewController:threeController animated:YES];
                
            }
            
            
        };
        secondController.wheelDidSwipRightBlock = ^(WheelsController *baseController, UIGestureRecognizer *sender)
        {
            [CategoriesLocalizer setCurrentLanguage: _languageSelected];

            blockm.wheels = [NSArray arrayWithObjects:LOCALIZE_KEY(@"payment"),LOCALIZE_KEY(@"receiptMoney"),LOCALIZE_KEY(@"check"),LOCALIZE_KEY(@"analyze"),LOCALIZE_KEY(@"setting"), nil];
            blockm.imageArray = [NSArray arrayWithObjects:@"a.png",@"b.png",@"c.png",@"d.png",@"e.png", nil];
            [blockm.carousel reloadData];
            [navController popToViewController:blockm animated:YES];
        };
        
        
        if(index == 0)
        {
            secondController.wheels =  @[LOCALIZE_KEY(@"cash")];
            secondController.imageArray = @[@"Wheel_1"];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(260, 20, 20, 20)];
            [btn setBackgroundImage:[UIImage imageNamed:@"public_add"] forState:UIControlStateNormal];
            [secondController.view addSubview:btn];
            [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
            isLanguageSet = NO;
            
        } else if(index == 1)
        {
            isLanguageSet = NO;
            
        } else if(index == 2)
        {
            isLanguageSet = NO;
            
        } else if(index == 3)
        {

            isLanguageSet =NO;
        }
        else if(index == 4)
        {
            secondController.wheels = @[LOCALIZE_KEY(@"languagesetting")];
            secondController.imageArray = @[@"a.png"];
            isLanguageSet = YES;


        }
        [secondController.carousel reloadData];
        [navController pushViewController:secondController animated:YES];
    };
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)didClicked:(id)sender
{
    FinanceAccountOrderController *financeAccountController = [[FinanceAccountOrderController alloc] init];
    [nav pushViewController:financeAccountController animated:YES];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
