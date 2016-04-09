//
//  MHYahooWeatherParallaxCell.m
//  CollectViewTest
//
//  Created by Michael Henry Pantaleon on 4/08/2014.
//  Copyright (c) 2014 Michael Henry Pantaleon. All rights reserved.
//

#import "MHYahooWeatherParallaxCell.h"

@interface MHYahooWeatherParallaxCell () <UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;



@end

@implementation MHYahooWeatherParallaxCell

@synthesize parallaxImageView = _parallaxImageView;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        _parallaxImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
//        _parallaxImageView.contentMode = UIViewContentModeCenter;
//        [self.contentView addSubview:_parallaxImageView];
//    }
//    return self;
//}
-(void) prepareForReuse
{
    [super prepareForReuse];
    
    [_contentScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}
-(void) awakeFromNib
{
    self.scrollView.delegate = self;
    
    self.contentScrollView.backgroundColor = [UIColor clearColor];
    
    if (!self.parallaxImageView)
    {
        _parallaxImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 1024, 768)];
        _parallaxImageView.contentMode = UIViewContentModeCenter;
        
        [self.contentView addSubview:_parallaxImageView];
        [self.contentView sendSubviewToBack:_parallaxImageView];
    }
}
- (void) layoutSubviews {
    _parallaxImageView.clipsToBounds = YES;
    _parallaxImageView.frame = CGRectMake(0.0f, 0.0f, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
}

+ (NSString*)reuseIdentifier {
    return NSStringFromClass([MHYahooWeatherParallaxCell class]);
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"y = %.2f", scrollView.contentOffset.y);
    
    CGFloat percent = scrollView.contentOffset.y / 650.0f;
    
    self.blurView.hidden = NO;
    self.blurView.alpha = percent;
    
}
-(void) updateWithNewContentView:(UIView *)contentView
{
    self.scrollView.contentOffset = CGPointZero;
    [self.contentScrollView addSubview:contentView];
    self.contentScrollViewHeight.constant = contentView.frame.size.height;
}
@end
