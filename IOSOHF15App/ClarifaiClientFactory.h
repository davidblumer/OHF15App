//
//  ClarifaiClientFactory.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SBSynthesizeSingleton.h>

#import "ClarifaiClient.h"
#import "Settings.h"

@interface ClarifaiClientFactory : NSObject
{
    @private
        ClarifaiClient *client;
}

+ (ClarifaiClientFactory *)sharedClarifaiClientFactory;

- (ClarifaiClient *)client;

@end