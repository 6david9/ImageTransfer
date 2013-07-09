//
//  CBViewController.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "CBViewController.h"
#import "CBSendingViewController.h"
#import "CBReceivingViewController.h"

@interface CBViewController ()

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showSendingView:(UIButton *)sender
{
    CBSendingViewController *sendingViewController = [[CBSendingViewController alloc] initWithNibName:@"CBSendingViewController" bundle:nil];
    [self presentViewController:sendingViewController animated:YES completion:nil];
}

- (IBAction)showReceivingView:(UIButton *)sender
{
    CBReceivingViewController *receivingViewController = [[CBReceivingViewController alloc] initWithNibName:@"CBReceivingViewController" bundle:nil];
    [self presentViewController:receivingViewController animated:YES completion:nil];
}

@end
