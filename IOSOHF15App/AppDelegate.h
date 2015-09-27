//
//  AppDelegate.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SBAlertViewHelper.h>
#import <SBLanguage.h>

#import "LocationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;

- (void)setUpAlertViewHelper;

@end