//
//  FeMainViewController.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeMainViewController.h"
#import "FeChannelsViewController.h"

@interface FeMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *onAirLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descriptionlLblLeft;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *arrFloatingtImage;

@end

@implementation FeMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCommon];
    
    [self animateAllFloatingImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initCommon
{
    self.onAirLbl.layer.borderColor = [UIColor whiteColor].CGColor;
    self.onAirLbl.layer.borderWidth = 1;
    
    // Animate
    [self.view layoutIfNeeded];
    
    self.descriptionlLblLeft.constant =  - 200;
    
    [UIView animateWithDuration:20.0f delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:nil];
    
}
- (IBAction)findChannelBtnTapped:(id)sender
{
    FeChannelsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FeChannelsViewController"];
    
    [self.navigationController pushViewController:controller animated:YES];
}
-(void) animateAllFloatingImageView
{
    for (UIImageView *imageView in self.arrFloatingtImage)
    {
        [UIView animateWithDuration:20.0f delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationCurveLinear | UIViewAnimationOptionAutoreverse animations:^{
            
            NSInteger x = rand() % (300 - (-300)) + (-300); //create the random number.
            NSInteger y = rand() % (300 - (-300)) + (-300);
            
            NSInteger direction = arc4random() % 2;
            direction = direction == 0 ? -1 : 1;
            
            imageView.layer.transform = CATransform3DMakeTranslation(direction * x, direction * y, 0);
            
        } completion:nil];
    }
}


@end
