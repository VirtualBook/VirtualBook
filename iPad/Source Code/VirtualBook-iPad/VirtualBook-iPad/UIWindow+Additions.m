//
//  UIWindow+Additions.m
//  feels
//
//  Created by Nghia Tran Vinh on 1/10/16.
//  Copyright © 2016 com.feelsfashionltd.feels. All rights reserved.
//

#import "UIWindow+Additions.h"

@implementation UIWindow (Additions)

- (void)setRootViewController: (UIViewController *)rootViewController animated: (BOOL)animated completionBlock:(dispatch_block_t) completionBlock
{
    UIView *snapShotView;
    
    if (animated)
    {
        snapShotView = [self snapshotViewAfterScreenUpdates: YES];
        [rootViewController.view addSubview: snapShotView];
    }
    
    [self setRootViewController: rootViewController];
    
    if (animated)
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            snapShotView.layer.opacity = 0;
            snapShotView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
            
        } completion:^(BOOL finished) {
            
            [snapShotView removeFromSuperview];
            
            if (completionBlock)
            {
                completionBlock();
            }
        }];
    }
}

@end
