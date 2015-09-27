//
//  LocationController.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 12/06/15.
//  Copyright (c) 2015 Socialbit GmbH. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

#import <SBSynthesizeSingleton.h>
#import <SBDeviceHelper.h>

#import "ApiController.h"

@interface LocationController : NSObject <CLLocationManagerDelegate>
{
    @private
        CLLocation *lastLocation;
}

@property(strong, nonatomic) CLLocationManager *locationManager;

+ (LocationController *)sharedLocationController;

- (BOOL)hasAccess;
- (BOOL)hasLastLocation;
- (CLLocation *)lastLocation;
- (void)start;
- (void)stop;

@end