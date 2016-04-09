//
//  SlideData_Whale.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "SlideData_Whale.h"
#import <FLAnimatedImage/FLAnimatedImage.h>
#import "MBProgressHUD.h"
#import <XCDYouTubeKit.h>
#import "AppDelegate.h"

@interface SlideData_Whale ()

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *mapGIFImageView;
@property  (strong, nonatomic) FLAnimatedImage *GIFData;
@property (strong, nonatomic) MBProgressHUD *hub;

@end

@implementation SlideData_Whale

-(void) awakeFromNib
{
    if (!self.GIFData)
    {
        NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"GIF_Whale_Map" withExtension:@"gif"];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        self.GIFData = [FLAnimatedImage animatedImageWithGIFData:data1];
    }

    self.mapGIFImageView.animatedImage = self.GIFData;
}
- (IBAction)oculusBtnTapped:(id)sender
{
    [[[UIAlertView alloc] initWithTitle:@"Oculus" message:@"Waiting..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

- (IBAction)youtubeBtnTapped:(id)sender
{
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"9pjI2XkmoL0"];
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.window.rootViewController presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
}

@end
