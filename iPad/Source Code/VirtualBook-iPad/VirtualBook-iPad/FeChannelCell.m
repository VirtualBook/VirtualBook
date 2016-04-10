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
    
    self.containerView.clipsToBounds = YES;
    self.contentView.layer.cornerRadius = 10;
    
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
            self.backgroundImageView.image = [UIImage imageNamed:@"thumb_1.jpg"];
            self.titleLbl.text = @"BLUE WHALE";
            
            break;
        }
        case 1:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"mount-everest-02.jpg"];
            self.titleLbl.text = @"EVEREST MOUNTAIN";
            break;
        }
        case 2:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"ocean.jpg"];
            self.titleLbl.text = @"OCEAN";
            break;
        }
        case 3:
        {
            self.backgroundImageView.image = [UIImage imageNamed:@"grand.jpg"];
            self.titleLbl.text = @"GRAND CANYON";
            
            break;
        }
            
            
    }
}

@end
