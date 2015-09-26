//
//  ClarifaiClientFactory.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "ClarifaiClientFactory.h"

@implementation ClarifaiClientFactory

SB_SYNTHESIZE_SINGLETON_GCD(ClarifaiClientFactory)

- (ClarifaiClient *)client
{
    if (client == nil)
    {
        client = [[ClarifaiClient alloc] initWithAppID:ClarifaiAppId appSecret:ClarifaiAppSecret];
    }
    
    return client;
}

@end