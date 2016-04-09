//
//  UIWindow+Additions.h
//  feels
//
//  Created by Nghia Tran Vinh on 1/10/16.
//  Copyright © 2016 com.feelsfashionltd.feels. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Additions)

- (void)setRootViewController: (UIViewController *)rootViewController animated: (BOOL)animated completionBlock:(dispatch_block_t) completionBlock;

@end
