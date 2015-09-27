//
//  CodeSelectionTableViewController.h
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SBLanguage.h>

@interface TypeSelectionTableViewController : UITableViewController
{
    @private
        NSArray *types;
}

- (void)loadData;

@end