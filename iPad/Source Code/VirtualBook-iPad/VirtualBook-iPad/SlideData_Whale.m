//
//  SlideData_Whale.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "SlideData_Whale.h"
#import <FLAnimatedImage/FLAnimatedImage.h>


@interface SlideData_Whale ()

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *mapGIFImageView;
@property  (strong, nonatomic) FLAnimatedImage *GIFData;

@end

@implementation SlideData_Whale

-(void) awakeFromNib
{
    if (!self.GIFData)
    {
        NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"Whale_GIF_Map" withExtension:@"gif"];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        self.GIFData = [FLAnimatedImage animatedImageWithGIFData:data1];
    }

    self.mapGIFImageView.animatedImage = self.GIFData;
}

@end
