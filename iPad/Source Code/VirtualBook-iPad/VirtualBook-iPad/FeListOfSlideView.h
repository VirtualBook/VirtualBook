//
//  FeListOfSlideViewController.h
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeListOfSlideViewDelegate;

@interface FeListOfSlideView : UIView

@property (weak, nonatomic) id<FeListOfSlideViewDelegate> delegate;


@end

@protocol FeListOfSlideViewDelegate <NSObject>

-(void) FeListOfSlideViewDidBack:(FeListOfSlideView *) sender;

-(void) FeListOfSlideView:(FeListOfSlideView *) sender presentSlideAt:(NSInteger) index;
@end

@interface FeScrollView : UIScrollView

@end