//
//  MapViewViewController.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import <SVProgressHUD/SVProgressHUD.h>

#import <SBLanguage.h>

#import "ApiController.h"
#import "ImageProcessor.h"
#import "LocationController.h"

@interface MapViewViewController : UIViewController <UIImagePickerControllerDelegate>
{
    @private
        NSArray                 *points;
        UIImagePickerController *imagePicker;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)setPoints:(NSArray *)newPoints;
- (void)showCamera;
- (void)showTypeSelection;
- (void)update;

@end