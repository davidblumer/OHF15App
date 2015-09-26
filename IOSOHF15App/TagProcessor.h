//
//  TagProcessor.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TagProcessorCallback)();

@interface TagProcessor : NSObject
{
    
}

+ (void)processTags:(NSArray *)tags probabilities:(NSArray *)probabilities callback:(TagProcessorCallback)callback;

@end