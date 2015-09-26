//
//  MainViewController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

#pragma mark -

- (void)configureLeftMenuButton:(UIButton *)button
{
    UIImage *image = [UIImage imageNamed:@"Menu36"];
    
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 36, 36);
    button.frame = frame;
    
    [button setImage:image forState:UIControlStateNormal];
}

- (BOOL)deepnessForLeftMenu
{
    return YES;
}

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    return @"mapSegue";
}

@end