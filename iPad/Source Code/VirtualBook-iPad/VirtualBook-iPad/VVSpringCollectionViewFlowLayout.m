//
//  VVSpringCollectionViewFlowLayout.m
//  VVSpringCollectionViewDemo
//
//  Created by 王 巍 on 13-9-1.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "VVSpringCollectionViewFlowLayout.h"

@interface VVSpringCollectionViewFlowLayout()
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (strong, nonatomic) NSArray *arrRotate;

@end

@implementation VVSpringCollectionViewFlowLayout

-(id)init {
    if ([super init]) {
        _springDamping = 0.5;
        _springFrequency = 0.8;
        _resistanceFactor = 500;
    }
    return self;
}

-(void)setSpringDamping:(CGFloat)springDamping {
    if (springDamping >= 0 && _springDamping != springDamping) {
        _springDamping = springDamping;
        for (UIAttachmentBehavior *spring in _animator.behaviors) {
            spring.damping = _springDamping;
        }
    }
}

-(void)setSpringFrequency:(CGFloat)springFrequency {
    if (springFrequency >= 0 && _springFrequency != springFrequency) {
        _springFrequency = springFrequency;
        for (UIAttachmentBehavior *spring in _animator.behaviors) {
            spring.frequency = _springFrequency;
        }
    }
}

-(void)prepareLayout {
    [super prepareLayout];
    
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
        CGSize contentSize = [self collectionViewContentSize];
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        // Rotate
        NSMutableArray *rotations = [@[] mutableCopy];
        
        CGFloat percentage = 0.0f;
        for (NSInteger i = 0; i < items.count; i++) {
            // ensure that each angle is different enough to be seen
            CGFloat newPercentage = 0.0f;
            do {
                newPercentage = ((CGFloat)(arc4random() % 220) - 110) * 0.0001f;
            } while (fabs(percentage - newPercentage) < 0.003);
            percentage = newPercentage;
            
            CGFloat angle = 2 * M_PI * (1.0f + percentage);
            CATransform3D transform = CATransform3DMakeRotation(angle, 0.0f, 0.0f, 1.0f);
            
            [rotations addObject:[NSValue valueWithCATransform3D:transform]];
        }
        
        self.arrRotate = [rotations copy];
        
        for (NSInteger i = 0 ; i < items.count ; i++) {
            
            UICollectionViewLayoutAttributes *item = items[i];
            //item.transform3D = [self.arrRotate[i] CATransform3DValue];
            
            UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
            
            spring.length = 0;
            spring.damping = self.springDamping;
            spring.frequency = self.springFrequency;
            
            [_animator addBehavior:spring];
        }
    }
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return [_animator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_animator layoutAttributesForCellAtIndexPath:indexPath];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.x - scrollView.bounds.origin.x;
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *spring in _animator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        CGFloat distanceFromTouch = fabs(touchLocation.x - anchorPoint.x);
        CGFloat scrollResistance = distanceFromTouch / self.resistanceFactor;
        
        UICollectionViewLayoutAttributes<UIDynamicItem> *item = (UICollectionViewLayoutAttributes *)[spring.items firstObject];
        
        CGPoint center = item.center;
        center.x += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta * scrollResistance)
                                      : MAX(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [_animator updateItemUsingCurrentState:item];
    }
    return NO;
}

@end
