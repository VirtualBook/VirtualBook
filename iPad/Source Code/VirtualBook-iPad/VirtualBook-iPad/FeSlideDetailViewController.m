//
//  FeSlideDetailViewController.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeSlideDetailViewController.h"
#import "MHYahooParallaxView.h"
#import "MHYahooWeatherParallaxCell.h"
#import "FeListOfSlideView.h"
#import "SlideData_Whale.h"
#import "SlideData_Trout.h"

@interface FeSlideDetailViewController ()<MHYahooParallaxViewDatasource,MHYahooParallaxViewDelegate, FeListOfSlideViewDelegate>

@property (strong, nonatomic) MHYahooParallaxView * parallaxView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;

@property (strong, nonatomic) FeListOfSlideView *listOfView;

@property (strong, nonatomic) SlideData_Whale *contentView_1;
@property (strong, nonatomic) SlideData_Trout *contentView_2;

@end

@implementation FeSlideDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentView_1 = [[[NSBundle mainBundle] loadNibNamed:@"SlideData_Whale" owner:self options:nil] firstObject];
    self.contentView_1.backgroundColor = [UIColor clearColor];
    self.contentView_1.rootViewController = self;
    
    self.contentView_2 = [[[NSBundle mainBundle] loadNibNamed:@"SlideData_Trout" owner:self options:nil] firstObject];
    self.contentView_2.backgroundColor = [UIColor clearColor];
    
    [self initParallax];
    
    [self.parallaxView.parallaxCollectionView reloadData];
}
-(void) initParallax
{
    self.parallaxView = [[MHYahooParallaxView alloc]initWithFrame:CGRectMake(0.0f,0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    
    //[self.parallaxView registerClass:[MHYahooWeatherParallaxCell class] forCellWithReuseIdentifier:[MHYahooWeatherParallaxCell reuseIdentifier]];
    [self.parallaxView.parallaxCollectionView registerNib:[UINib nibWithNibName:@"MHYahooWeatherParallaxCell" bundle:nil] forCellWithReuseIdentifier:[MHYahooWeatherParallaxCell reuseIdentifier]];
    
    self.parallaxView.delegate = self;
    self.parallaxView.datasource = self;
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.parallaxView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    // Left
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.parallaxView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    // Right
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.parallaxView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    // Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.parallaxView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    
    [self.view insertSubview:self.parallaxView atIndex:0];
    [self.view addConstraints:@[top, left, right, bottom]];
}

#pragma mark - Parralax
- (UICollectionViewCell*) parallaxView:(MHYahooParallaxView *)parallaxView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MHYahooWeatherParallaxCell * cell = (MHYahooWeatherParallaxCell*)[parallaxView dequeueReusableCellWithReuseIdentifier:[MHYahooWeatherParallaxCell reuseIdentifier] forIndexPath:indexPath];
    
    
    switch (indexPath.item) {
        case 0:
            cell.parallaxImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"slide_1_a.jpg"]];
            break;
        case 1:
            cell.parallaxImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"slide_2.jpg"]];
            break;
        case 2:
            cell.parallaxImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"slide_3.jpg"]];
            break;
        case 3:
            cell.parallaxImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"slide_4.jpg"]];
            break;
    }

    if (cell && indexPath.item == 0 && !self.contentView_1.superview)
    {
        [cell updateWithNewContentView:self.contentView_1];
    }
    else if (cell && indexPath.item == 1 && !self.contentView_2.superview)
    {
        [cell updateWithNewContentView:self.contentView_2];
    }
    
    return cell;
}


- (NSInteger) numberOfRowsInParallaxView:(MHYahooParallaxView *)parallaxView {
    return 4;
}

- (void)parallaxViewDidScrollHorizontally:(MHYahooParallaxView *)parallaxView leftIndex:(NSInteger)leftIndex leftImageLeftMargin:(CGFloat)leftImageLeftMargin leftImageWidth:(CGFloat)leftImageWidth rightIndex:(NSInteger)rightIndex rightImageLeftMargin:(CGFloat)rightImageLeftMargin rightImageWidth:(CGFloat)rightImageWidth {
    
    // leftIndex and Right Index should must be greater than or equal to zero
    
    if(leftIndex >= 0){
        MHYahooWeatherParallaxCell * leftCell = (MHYahooWeatherParallaxCell*)[parallaxView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:leftIndex inSection:0]];
        
        CGRect frame = leftCell.parallaxImageView.frame;
        frame.origin.x = leftImageLeftMargin;
        frame.size.width = leftImageWidth;
        
        leftCell.parallaxImageView.frame = frame;
    }
    if(rightIndex >= 0){
        MHYahooWeatherParallaxCell * rightCell = (MHYahooWeatherParallaxCell*)[parallaxView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:rightIndex inSection:0]];
        CGRect frame = rightCell.parallaxImageView.frame;
        frame.origin.x = rightImageLeftMargin;
        frame.size.width = rightImageWidth;
        rightCell.parallaxImageView.frame = frame;
    }
    
}
-(FeListOfSlideView *)listOfView
{
    if (!_listOfView)
    {
        _listOfView = [[[NSBundle mainBundle] loadNibNamed:@"FeListOfSlideView" owner:self options:nil] firstObject];
        _listOfView.translatesAutoresizingMaskIntoConstraints = NO;
        _listOfView.alpha = 0;
        _listOfView.delegate = self;
    }
    
    return _listOfView;
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

- (IBAction)menuBtnTapped:(id)sender
{
    if (self.listOfView && !self.listOfView.superview)
    {
        // Add
        [self initConstraintWithView:self.listOfView];
        
        self.blurView.hidden = NO;
        self.blurView.alpha = 0;
        
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.listOfView.alpha = 1;
            self.blurView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void) FeListOfSlideViewDidBack:(FeListOfSlideView *)sender
{
    if (self.listOfView && self.listOfView.superview )
    {
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.listOfView.alpha = 0;
            self.blurView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [self.listOfView removeFromSuperview];
            
        }];
    }
}
-(void) FeListOfSlideView:(FeListOfSlideView *)sender presentSlideAt:(NSInteger)index
{
    
    [self.parallaxView setCurrentIndex:index animated:NO];
    
    [self FeListOfSlideViewDidBack:nil];
}

@end
