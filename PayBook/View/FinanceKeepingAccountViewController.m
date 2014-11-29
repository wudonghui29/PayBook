//
//  FinanceKeepingAccountViewController.m
//  PayBook
//
//  Created by wudonghui on 11/27/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "FinanceKeepingAccountViewController.h"
#import "ClassesInterface.h"

@interface FinanceKeepingAccountViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
{
    JRImageView *imamgeView;
}

@end

@implementation FinanceKeepingAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary* specification = [JsonFileManager getJsonFromFile:@"FinanceKeepingAccount.json"];
    JsonView* jsonview = (JsonView*)[JsonViewRenderHelper render:@"" specifications: specification];
    [self.view addSubview: jsonview];
    NSString* orderNO = [@"" stringByAppendingString:[DateHelper stringFromDate:[NSDate date] pattern:@"yyyy-MM-dd"]];
    [((id<JRComponentProtocal>)[jsonview getView:@"createDate"]) setValue: orderNO];
    JRTextField *labelTextField = ((JRLabelTextFieldView *)[jsonview getView:@"createDate"]).textField;
    [labelTextField setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    labelTextField.textAlignment = NSTextAlignmentCenter;
    
    
    JRTextView *remarkTextView =((JRLabelTextView *) [jsonview getView:@"remark"]).textView;
    [remarkTextView setFont:[UIFont fontWithName:@"STHeitiSC" size:30.00]];

    JRTextField *amountTextField = ((JRLabelTextFieldView *)[jsonview getView:@"amount"]).textField;
    [amountTextField setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    
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

    JRTextField *title_O = (JRTextField *)[jsonview getView:@"title_O"];
    [title_O setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    JRTextField *title_1 = (JRTextField *)[jsonview getView:@"title_1"];
    [title_1 setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];
    
    JRTextField *imageName = (JRTextField *)[jsonview getView:@"imageName"];
    [imageName setFont:[UIFont fontWithName:@"STHeitiSC" size:20.00]];

    imamgeView = (JRImageView *)[jsonview getView:@"BG_IMAGE"];
    JRButton *takePhotoBtn = (JRButton *)[jsonview getView:@"BTN_Take"];
    takePhotoBtn.didClikcButtonAction = ^(JRButton *senderr){
        [self didClickedBTN:senderr];
    };
    JRButton *saveBTN = (JRButton *)[jsonview getView:@"BTN_Save"];
    saveBTN.didClikcButtonAction = ^(JRButton *sender){

    };

}

- (void)didClickedBTN:(id)sender
{
    
    NSString *takePhotoString = LOCALIZE_KEY(@"takePhoto");
    NSString *photoLibString = LOCALIZE_KEY(@"photoLibrary");
    NSString *cancleString = LOCALIZE_KEY(@"cancle");
    NSString *selectString = LOCALIZE_KEY(@"select");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:selectString delegate:self cancelButtonTitle:cancleString destructiveButtonTitle:photoLibString otherButtonTitles:takePhotoString, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            [self takePhoto];
        else{
            [self photos];
        }
    }
    else if(buttonIndex == 0)
    {
        [self photos];
    }
}
- (void)takePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeCamera;
    picker.sourceType = type;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)photos
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;

    picker.sourceType = type;
    [self presentViewController:picker animated:YES completion:nil];

    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)
{
    imamgeView.image = [editingInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:picker animated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}






@end
