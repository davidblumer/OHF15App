//
//  MapViewViewController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "MapViewViewController.h"

@interface MapViewViewController ()

@end

@implementation MapViewViewController

- (IBAction)addButtonPressed:(id)sender
{
    [self showCamera];
}

- (void)showCamera
{
    imagePicker = [[UIImagePickerController alloc] init];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    #if TARGET_IPHONE_SIMULATOR
    {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    #endif
    
    [imagePicker setSourceType:sourceType];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setDelegate:self];
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)showTypeSelection
{
    [self performSegueWithIdentifier:@"typeSelectionSegue" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = SBL(@"appTitle");
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [ImageProcessor processImage:image callback:^
    {
        [imagePicker dismissViewControllerAnimated:YES completion:nil];
        
        [SVProgressHUD dismiss];
        
        [SBAlertViewHelper showAlertViewWithTitle:SBL(@"clarifaiSuccessTitle") text:SBL(@"clarifaiSuccessText")];
    }];
}

@end