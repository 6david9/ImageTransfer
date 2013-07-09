//
//  CBReceivingViewController.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "CBReceivingViewController.h"
#import "Receiver.h"

@interface CBReceivingViewController () <ReceiverDelegate>
@end

@implementation CBReceivingViewController
{
    Receiver *dataReceiver;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    static NSString *ipAddr = nil;
    if (ipAddr == nil) {
        ipAddr = [DeviceInfo IPAddress];
    }
    self.IPLabel.text = ipAddr;
    dataReceiver = [[Receiver alloc] initWithPort:IMAGE_TRANSFER_PORT];
    dataReceiver.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [dataReceiver listen];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [dataReceiver disconnect];
}

- (IBAction)dismissViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Delegate
- (void)receiver:(Receiver *)receiver didReceiveData:(NSData *)data
{
    UIImage *img = [UIImage imageWithData:data];
    self.imageView.image = img;
}

@end
