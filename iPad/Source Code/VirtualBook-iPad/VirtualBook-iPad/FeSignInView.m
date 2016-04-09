//
//  FeSignInView.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeSignInView.h"
#import "UIFont+FeelsFont.h"

@interface FeSignInView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signLblTop;

@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

@end

@implementation FeSignInView

-(void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    
    self.emailTxt.attributedPlaceholder = [FeSignInView attributeStringForTextHolder:self.emailTxt.placeholder];
    self.passwordTxt.attributedPlaceholder = [FeSignInView attributeStringForTextHolder:self.passwordTxt.placeholder];
}
+(NSAttributedString *) attributeStringForTextHolder:(NSString *) str
{
    NSDictionary *dict = @{NSFontAttributeName : [UIFont fontWithFeelsFont:FeelsFont_SFUIText_Regular size:18],
                           NSForegroundColorAttributeName : [UIColor colorWithWhite:1.0f alpha:0.5f]};
    
    return [[[NSMutableAttributedString alloc] initWithString:str attributes:dict] copy];
}
-(void) hideKeyBoard
{
    [self.emailTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    
}

- (IBAction)backBtnTapped:(id)sender
{
    [self hideKeyBoard];
    
    if ([self.delegate respondsToSelector:@selector(FeSignInViewDidSelectBackBtn:)])
    {
        [self.delegate FeSignInViewDidSelectBackBtn:self];
    }
}
- (IBAction)registerBtnTapped:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"isLogin"];
    
    [self hideKeyBoard];
    
    if ([self.delegate respondsToSelector:@selector(FeSignInViewDidSelectRegisterBtn:)])
    {
        [self.delegate FeSignInViewDidSelectRegisterBtn:self];
    }
}
-(void) moveUpUIs
{
    [self layoutIfNeeded];
    
    self.signLblTop.constant = 25.0f;
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:nil];
}
-(void) moveDownUIs
{
    [self layoutIfNeeded];
    
    self.signLblTop.constant = 220.0f;
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
    } completion:nil];
}

@end
