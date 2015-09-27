//
//  LocationController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 12/06/15.
//  Copyright (c) 2015 Socialbit GmbH. All rights reserved.
//

#import "LocationController.h"

@implementation LocationController

SB_SYNTHESIZE_SINGLETON_GCD(LocationController)

- (BOOL)hasAccess
{
    return [CLLocationManager locationServicesEnabled];
}

- (BOOL)hasLastLocation
{
    return lastLocation != nil;
}

- (id)init
{
    self = [super init];
    
    if (self != nil)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        #ifdef DEBUG
        {
            //lastLocation = [[CLLocation alloc] initWithLatitude:51.50998 longitude:-0.1337];
        }
        #endif
    }
    
    return self;
}

- (CLLocation *)lastLocation
{
    return lastLocation;
}

- (void)start
{
    if ([SBDeviceHelper atLeastIOS8] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways)
    {
        [_locationManager requestAlwaysAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
}

- (void)stop
{
    [_locationManager stopUpdatingLocation];
}

#pragma mark CLLocationManager delegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (oldLocation.coordinate.latitude != newLocation.coordinate.latitude && oldLocation.coordinate.longitude != newLocation.coordinate.longitude)
    {
        float maxAccuracy = MAX(newLocation.verticalAccuracy, newLocation.horizontalAccuracy);
    
        NSLog(@"Location changed to: %f %f (Accuarcy: %f)", newLocation.coordinate.latitude, newLocation.coordinate.longitude, maxAccuracy);
            
        lastLocation = newLocation;
    }
}

@end