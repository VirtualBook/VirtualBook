//
//  FeChannelCell.m
//  VirtualBook
//
//  Created by Nghia Tran Vinh on 4/7/16.
//  Copyright © 2016 NghiaTran. All rights reserved.
//

#import "FeChannelCell.h"

@interface FeChannelCell ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@end

@implementation FeChannelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    CGRect bound = CGRectMake(0, 0, 450, 450);
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect: bound
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bound;
    maskLayer.path = maskPath.CGPath;
    self.containerView.layer.mask = maskLayer;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(3, 3);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowRadius = 3;
    self.backgroundImageView.layer.cornerRadius = 10;
    self.backgroundImageView.clipsToBounds = YES;
}

-(void) updateAssetWithItem:(NSInteger)item
{
    switch (item) {
        case 0:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"channel_1_1.jpg"];
            self.titleLbl.text = @"The Earth";
            
            break;
        }
        case 1:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"channel_1_2.jpg"];
            self.titleLbl.text = @"Cycle life of Sun";
            break;
        }
        case 2:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"channel_1_3.jpg"];
            self.titleLbl.text = @"Blue Whale";
            break;
        }
        case 3:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"channel_1_4.jpg"];
            self.titleLbl.text = @"White Tiger";
            break;
        }
            
            
    }
}

@end
