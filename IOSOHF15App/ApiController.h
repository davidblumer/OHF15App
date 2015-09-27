//
//  ApiController.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 27/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import <SBSynthesizeSingleton.h>

#import "LocationController.h"
#import "MapViewViewController.h"
#import "Settings.h"

@class MapViewViewController;

@interface ApiController : NSObject
{
    
}

+ (ApiController *)sharedApiController;

- (NSString *)getUrl:(NSString *)url;
- (void)getTagsForLocation:(CLLocation *)location mapViewViewController:(MapViewViewController *)mapViewViewController;
- (void)postTags:(NSArray *)tags fromLocation:(CLLocation *)location;

@end