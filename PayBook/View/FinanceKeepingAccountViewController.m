//
//  FinanceKeepingAccountViewController.m
//  PayBook
//
//  Created by wudonghui on 11/27/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "FinanceKeepingAccountViewController.h"
#import "JRComponents.h"

@interface FinanceKeepingAccountViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    JRImageView *imamgeView;
}

@end

@implementation FinanceKeepingAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block FinanceKeepingAccountViewController *blockSelf = self;
    NSDictionary* specification = [JsonFileManager getJsonFromFile:@"FinanceKeepingAccount.json"];
    JsonView* jsonview = (JsonView*)[JsonViewRenderHelper render:@"" specifications: specification];
    [self.view addSubview: jsonview];
    NSString* orderNO = [@"" stringByAppendingString:[DateHelper stringFromDate:[NSDate date] pattern:@"yyyy-MM-dd"]];
    [((id<JRComponentProtocal>)[jsonview getView:@"createDate"]) setValue: orderNO];
    JRTextField *labelTextField = ((JRLabelTextFieldView *)[jsonview getView:@"createDate"]).textField;
    [labelTextField setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    labelTextField.textAlignment = NSTextAlignmentCenter;
    
    
    JRTextView *remarkTextView =(JRTextView *) [jsonview getView:@"remarkTextView"];
    [remarkTextView setFont:[UIFont fontWithName:@"STHeitiSC" size:30.00]];

    
    
    JRButton* backButton = (JRButton *)[jsonview getView:@"BTN_Back"];
    backButton.didClikcButtonAction = ^void(JRButton* btn) {
        [self.navigationController popViewControllerAnimated: YES];
    };
   JRTextField *balance = (JRTextField *)[jsonview getView:@"balance"];
   [balance setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *account = (JRTextField *)[jsonview getView:@"account"];
    [account setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *category = (JRTextField *)[jsonview getView:@"category"];
    [category setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];

    JRTextView *imageName = (JRTextView *)[jsonview getView:@"imageName"];
    [imageName setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    imamgeView = (JRImageView *)[jsonview getView:@"BG_IMAGE"];
    JRButton *takePhotoBtn = (JRButton *)[jsonview getView:@"BTN_Take"];
    takePhotoBtn.didClikcButtonAction = ^(JRButton *senderr){
        
    [self didClickedBTN:senderr];
        


    };
    JRButton *saveBTN = (JRButton *)[jsonview getView:@"BTN_Save"];
    saveBTN.didClikcButtonAction = ^(JRButton *sender){
//        NSLog(@"++++++");
    };



}

- (void)didClickedBTN:(id)sender
{
    
   
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)
{
    imamgeView.image = [editingInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}






@end
