//
//  TagProcessor.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "TagProcessor.h"

@implementation TagProcessor

+ (void)processTags:(NSArray *)tags probabilities:(NSArray *)probabilities callback:(TagProcessorCallback)callback
{
    NSLog(@"Processing %i tags and %i probabilities", (int)[tags count], (int)[probabilities count]);
    
    CLLocation *lastLocation = [LocationController sharedLocationController];
    
    [[ApiController sharedApiController] postTags:tags fromLocation:lastLocation];
    
    callback();
}

@end