//
//  MapViewViewController.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SVProgressHUD/SVProgressHUD.h>

#import <SBLanguage.h>

#import "ImageProcessor.h"

@interface MapViewViewController : UIViewController <UIImagePickerControllerDelegate>
{
    @private
        UIImagePickerController *imagePicker;
}

- (void)showCamera;

@end