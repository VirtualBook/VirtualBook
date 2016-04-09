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
    
    [self initCommon];
    
    [self initNotification];
    
    [self initWelcomeScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void) initCommon
{
    screenSize = [UIScreen mainScreen].bounds.size;
    _currentState = FeLoginViewControllerState_Main;
}
-(void) initWelcomeScreen
{
    // Add page
    EAIntroPage *page_1 = [EAIntroPage pageWithCustomViewFromNibNamed:@"Welcome_1"];
    EAIntroPage *page_2 = [EAIntroPage pageWithCustomViewFromNibNamed:@"Welcome_2"];
    EAIntroPage *page_3 = [EAIntroPage pageWithCustomViewFromNibNamed:@"Welcome_3"];
    
    self.introView = [[EAIntroView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height) andPages:@[page_1, page_2, page_3]];
    self.introView.delegate = self;
    [self.view addSubview:self.introView];
}

#pragma mark - notification
-(void) initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardWillShow:(NSNotification *) noti
{
    if (self.currentState == FeLoginViewControllerState_SignUp)
    {
        [self.signUpView moveUpUIs];
    }
    else if (self.currentState == FeLoginViewControllerState_SignIn)
    {
        [self.signInView moveUpUIs];
    }
}
-(void)keyboardDidHide:(NSNotification *) noti
{
    if (self.currentState == FeLoginViewControllerState_SignUp)
    {
        [self.signUpView moveDownUIs];
    }
    else if (self.currentState == FeLoginViewControllerState_SignIn)
    {
        [self.signInView moveDownUIs];
    }
}

#pragma mark - EAIntro Delegate
-(void) introDidFinish:(EAIntroView *)introView
{
    
}
- (IBAction)registerBtnTapped:(id)sender
{
    [self addSignUpViewIntoMainiew];
}
- (IBAction)loginBtnTapped:(id)sender
{
    [self addSignInViewIntoMainiew];
}

#pragma mark - Getter
-(FeSignUpView *) signUpView
{
    if (!_signUpView)
    {
        _signUpView = [[[NSBundle mainBundle] loadNibNamed:@"FeSignUpView" owner:self options:nil] firstObject];
        _signUpView.translatesAutoresizingMaskIntoConstraints = NO;
        _signUpView.alpha = 0;
        _signUpView.delegate = self;
    }
    
    return _signUpView;
}
-(void) addSignUpViewIntoMainiew
{
    if (self.signUpView && !self.signUpView.superview && self.currentState == FeLoginViewControllerState_Main)
    {
        // Add
        [self initConstraintWithView:self.signUpView];
        
        // Animation
        self.currentState = FeLoginViewControllerState_SignUp;
        
        self.blurView.hidden = NO;
        self.blurView.alpha = 0;
        
        [self.signUpView moveDownUIs];
        
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.logoImageView.alpha = 0;
            self.titleLbl.alpha = 0;
            self.loginBtn.alpha = 0;
            self.registerBtn.alpha = 0;
            
            self.signUpView.alpha = 1;
            self.blurView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(FeSignInView *) signInView
{
    if (!_signInView)
    {
        _signInView = [[[NSBundle mainBundle] loadNibNamed:@"FeSignInView" owner:self options:nil] firstObject];
        _signInView.translatesAutoresizingMaskIntoConstraints = NO;
        _signInView.alpha = 0;
        _signInView.delegate = self;
    }
    
    return _signInView;
}
-(void) addSignInViewIntoMainiew
{
    if (self.signInView && !self.signInView.superview && self.currentState == FeLoginViewControllerState_Main)
    {
        // Add
        [self initConstraintWithView:self.signInView];
        
        // ANimate
        self.currentState = FeLoginViewControllerState_SignIn;
        
        [self.signInView moveDownUIs];
        
        self.blurView.hidden = NO;
        self.blurView.alpha = 0;
        
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.logoImageView.alpha = 0;
            self.titleLbl.alpha = 0;
            self.loginBtn.alpha = 0;
            self.registerBtn.alpha = 0;
            
            self.signInView.alpha = 1;
            self.blurView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void) initConstraintWithView:(UIView *) view
{
    // Add
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    // Left
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    // Right
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    // Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    
    [self.view addSubview:view];
    
    [self.view addConstraints:@[top, left, right, bottom]];
}

#pragma mark - Sign Up
-(void) FeSignUpViewDidSelectRegisterBtn:(FeSignUpView *)sender
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    [app switchToMainApp];
}
-(void) FeSignUpViewDidSelectBackBtn:(FeSignUpView *)sender
{
    if (self.signUpView && self.signUpView.superview && self.currentState == FeLoginViewControllerState_SignUp)
    {
        self.currentState = FeLoginViewControllerState_Main;
        
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.logoImageView.alpha = 1;
            self.titleLbl.alpha = 1;
            self.loginBtn.alpha = 1;
            self.registerBtn.alpha = 1;
            
            self.signUpView.alpha = 0;
            self.blurView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [self.signUpView removeFromSuperview];
            
        }];
    }
}

#pragma mark - Sign In
-(void) FeSignInViewDidSelectRegisterBtn:(FeSignUpView *)sender
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    [app switchToMainApp];
}
-(void) FeSignInViewDidSelectBackBtn:(FeSignUpView *)sender
{
    if (self.signInView && self.signInView.superview && self.currentState == FeLoginViewControllerState_SignIn)
    {
        self.currentState = FeLoginViewControllerState_Main;
        
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.logoImageView.alpha = 1;
            self.titleLbl.alpha = 1;
            self.loginBtn.alpha = 1;
            self.registerBtn.alpha = 1;
            
            self.signInView.alpha = 0;
            self.blurView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [self.signInView removeFromSuperview];
            
        }];
    }
}

@end
