//
//  DiscoveryTableViewController.h
//  Peeks
//
//  Created by Andreas Hammer on 16/07/14.
//  Copyright (c) 2014 Hammer Productions. All rights reserved.
//

#import <Parse/Parse.h>

@interface DiscoveryTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, retain) NSString *parseClassName;
@property(nonatomic, retain) NSMutableArray *countries;

@end
