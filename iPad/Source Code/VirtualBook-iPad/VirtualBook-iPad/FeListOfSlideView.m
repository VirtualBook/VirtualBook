//
//  FeListOfSlideViewController.m
//  VirtualBook-iPad
//
//  Created by Nghia Tran Vinh on 4/9/16.
//  Copyright © 2016 justdoit. All rights reserved.
//

#import "FeListOfSlideView.h"



@implementation FeScrollView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // If not dragging, send event to next responder
    if (!self.dragging){
        [self.nextResponder touchesBegan: touches withEvent:event];
    }
    else{
        [super touchesBegan: touches withEvent: event];
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // If not dragging, send event to next responder
    if (!self.dragging){
        [self.nextResponder touchesMoved: touches withEvent:event];
    }
    else{
        [super touchesMoved: touches withEvent: event];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // If not dragging, send event to next responder
    if (!self.dragging){
        [self.nextResponder touchesEnded: touches withEvent:event];
    }
    else{
        [super touchesEnded: touches withEvent: event];
    }
}

@end


@interface FeListOfSlideView ()

@property (weak, nonatomic) IBOutlet UIView *contentScrollView;

@end

@implementation FeListOfSlideView

-(void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
}
- (IBAction)backBtnTapped:(id)sender
{
    [self.delegate FeListOfSlideViewDidBack:self];
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.contentScrollView];
    
    for (UIView *subView in self.contentScrollView.subviews) {
        if (subView.tag >= 100)
        {
            if (CGRectContainsPoint(subView.frame, point)) {
                
                [self.delegate FeListOfSlideView:self presentSlideAt:subView.tag - 100];
                break;
            }
        }
    }
}

@end
