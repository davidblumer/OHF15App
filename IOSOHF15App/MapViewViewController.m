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
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = SBL(@"appTitle");
}



@end