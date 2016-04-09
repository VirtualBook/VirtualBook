//
//  FeLoginViewController.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeLoginViewController.h"
#import <EAIntroView/EAIntroPage.h>
#import <EAIntroPage.h>
#import <EAIntroView.h>
#import "FeSignInView.h"
#import "FeSignUpView.h"
#import "AppDelegate.h"

typedef NS_ENUM(NSInteger, FeLoginViewControllerState) {
    FeLoginViewControllerState_Main = 0,
    FeLoginViewControllerState_SignUp,
    FeLoginViewControllerState_SignIn
};


@interface FeLoginViewController () <EAIntroDelegate, FeSignUpViewDelegate, FeSignInViewDelegate>
{
    CGSize screenSize;
    BOOL isShowkeyboard;
}

@property (strong, nonatomic) EAIntroView *introView;
@property (assign, nonatomic) FeLoginViewControllerState currentState;

// Xib
@property (strong, nonatomic) FeSignUpView *signUpView;
@property (strong, nonatomic) FeSignInView *signInView;

// UIs
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;
@end

@implementation FeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
