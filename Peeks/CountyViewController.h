//
//  CountyViewController.h
//  Peeks
//
//  Created by Andreas Hammer on 03/08/14.
//  Copyright (c) 2014 Hammer Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CountyViewController : UITableViewController

@property(nonatomic, retain) NSString *parseClassName;
@property(nonatomic, retain) NSMutableArray *counties;

@end
