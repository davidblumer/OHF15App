//
//  CodeSelectionTableViewController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "TypeSelectionTableViewController.h"

@interface TypeSelectionTableViewController ()

@end

@implementation TypeSelectionTableViewController

- (void)loadData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Types" ofType:@"plist"];
    
    types = [NSArray arrayWithContentsOfFile:filePath];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = SBL(@"chooseType");
    
    [self loadData];
}

#pragma mark - UITableViewController delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [types count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeTableViewCell" forIndexPath:indexPath];
    
    NSString *typeIndex = [types objectAtIndex:indexPath.row];
    NSString *localizationIndex = [NSString stringWithFormat:@"type_%@", typeIndex];
    NSString *typeLocalized = SBL(localizationIndex);
    
    cell.textLabel.text = typeLocalized;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end