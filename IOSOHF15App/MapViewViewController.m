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
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = SBL(@"appTitle");
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
   // [SVProgressHUD show];
}

@end