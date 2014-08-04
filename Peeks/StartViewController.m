//
//  StartViewController.m
//  Peeks
//
//  Created by Andreas Hammer on 16/07/14.
//  Copyright (c) 2014 Hammer Productions. All rights reserved.
//

#import "StartViewController.h"
#import <Parse/Parse.h>

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(switchSegue) userInfo:nil repeats:NO];
}

-(void)switchSegue{
    [self performSegueWithIdentifier:@"start" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
