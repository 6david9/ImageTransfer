//
//  CBSendingViewController.m
//  ImageTransfer
//
//  Created by ly on 13-7-8.
//  Copyright (c) 2013年 Lei Yan. All rights reserved.
//

#import "CBSendingViewController.h"
#import "Sender.h"

@interface CBSendingViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

StrongProperty UIImagePickerController *imagePicker;

@end

@implementation CBSendingViewController
{
    Sender *dataSender;
    UITapGestureRecognizer *tapGestureRecognizer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)dismissViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)hideKeyboard:(UITextField *)sender
{
    [sender resignFirstResponder];
}

/* 发送图片 */
- (IBAction)sendImage:(id)sender
{
    dataSender = nil;
    dataSender = [[Sender alloc] initWithRemoteAddress:self.textField.text onPort:IMAGE_TRANSFER_PORT];
    // todo: 需要优化，针对不同类型的image都可以转成data
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    [dataSender sendData:imageData];
}

/* 从相册选择图片 */
- (IBAction)chooseImage:(id)sender
{
    [self presentModalViewController:self.imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    [self.imagePicker dismissModalViewControllerAnimated:YES];
}

#pragma mark - Getter
- (UIImagePickerController *)imagePicker
{
    if ( _imagePicker == nil )
    {
        if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] )
        {
            _imagePicker = [[UIImagePickerController alloc] init];
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            _imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            _imagePicker.delegate = self;
        }
    }
    return _imagePicker;
}

@end
