//
//  FeSignUpView.h
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeSignUpViewDelegate;

@interface FeSignUpView : UIView

@property (weak, nonatomic) id<FeSignUpViewDelegate> delegate;

-(void) moveUpUIs;
-(void) moveDownUIs;

@end

@protocol FeSignUpViewDelegate <NSObject>

-(void) FeSignUpViewDidSelectBackBtn:(FeSignUpView *) sender;
-(void) FeSignUpViewDidSelectRegisterBtn:(FeSignUpView *) sender;

@end