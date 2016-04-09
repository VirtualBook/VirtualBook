//
//  FeSignUpView.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeSignUpView.h"
#import "UIFont+FeelsFont.h"

@interface FeSignUpView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerLblTop;

// UIs
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyPassTextField;

@end

@implementation FeSignUpView


-(void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    
    self.fullNameTextField.attributedPlaceholder = [FeSignUpView attributeStringForTextHolder:self.fullNameTextField.placeholder];
    self.emailTextField.attributedPlaceholder = [FeSignUpView attributeStringForTextHolder:self.emailTextField.placeholder];
    self.passwordTextField.attributedPlaceholder = [FeSignUpView attributeStringForTextHolder:self.passwordTextField.placeholder];
    self.verifyPassTextField.attributedPlaceholder = [FeSignUpView attributeStringForTextHolder:self.verifyPassTextField.placeholder];
}
-(void) hideKeyBoard
{
    [self.fullNameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.verifyPassTextField resignFirstResponder];
    
}
+(NSAttributedString *) attributeStringForTextHolder:(NSString *) str
{
    NSDictionary *dict = @{NSFontAttributeName : [UIFont fontWithFeelsFont:FeelsFont_SFUIText_Regular size:18],
                           NSForegroundColorAttributeName : [UIColor colorWithWhite:1.0f alpha:0.5f]};
    
    return [[[NSMutableAttributedString alloc] initWithString:str attributes:dict] copy];
}
- (IBAction)backBtnTapped:(id)sender
{
    [self hideKeyBoard];
    
    if ([self.delegate respondsToSelector:@selector(FeSignUpViewDidSelectBackBtn:)])
    {
        [self.delegate FeSignUpViewDidSelectBackBtn:self];
    }
}
- (IBAction)registerBtnTapped:(id)sender
{
    [self hideKeyBoard];
    
    if ([self.delegate respondsToSelector:@selector(FeSignUpViewDidSelectRegisterBtn:)])
    {
        [self.delegate FeSignUpViewDidSelectRegisterBtn:self];
    }
}
-(void) moveUpUIs
{
    [self layoutIfNeeded];
    
    self.registerLblTop.constant = 25.0f;
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:nil];
}
-(void) moveDownUIs
{
    [self layoutIfNeeded];
    
    self.registerLblTop.constant = 220.0f;
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:nil];
}

@end
