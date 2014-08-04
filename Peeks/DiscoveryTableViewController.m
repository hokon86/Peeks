//
//  DiscoveryTableViewController.m
//  Peeks
//
//  Created by Andreas Hammer on 16/07/14.
//  Copyright (c) 2014 Hammer Productions. All rights reserved.
//

#import "DiscoveryTableViewController.h"
#import "CountyViewController.h"

@interface DiscoveryTableViewController ()

@end

@implementation DiscoveryTableViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    // Configure the cell to show todo item with a priority at the bottom
    PFObject *o = [self.countries objectAtIndex:indexPath.row];
    cell.textLabel.text = o[@"name"];
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.countries count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toCityView" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // This table displays items in the Todo class
    self.parseClassName = @"contries";
    self.parseClassName = [self.parseClassName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    PFQuery *qry = [[PFQuery alloc] initWithClassName:self.parseClassName];
    self.countries = [[NSMutableArray alloc] init];
    [qry findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            self.countries = [[NSMutableArray alloc] initWithArray:objects];
            [self.tableView reloadData];
        }
        else
            NSLog([error userInfo]);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"toCityView"]){
        CountyViewController *c = segue.destinationViewController;
        NSString *str = [[[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]] textLabel] text];
        c.parseClassName = str;
    }
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


@end
