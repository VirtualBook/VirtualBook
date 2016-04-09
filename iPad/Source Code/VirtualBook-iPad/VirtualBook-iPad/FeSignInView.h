//
//  FeSignInView.h
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeSignInViewDelegate;

@interface FeSignInView : UIView

@property (weak, nonatomic) id<FeSignInViewDelegate> delegate;

-(void) moveUpUIs;
-(void) moveDownUIs;


@end

@protocol FeSignInViewDelegate <NSObject>

-(void) FeSignInViewDidSelectBackBtn:(FeSignInView *) sender;
-(void) FeSignInViewDidSelectRegisterBtn:(FeSignInView *) sender;

@end