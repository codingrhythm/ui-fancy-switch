//
//  UIFancySwitchButton.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIFancySwitchButton.h"

@implementation UIFancySwitchButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setImage:[UIImage imageNamed:@"slider-btn"]];
    }
    return self;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.superview];
    
    // constrain the moving position and only move horizontally
    CGFloat newX = location.x;
    
    if (newX > _maxPosX){
        newX = _maxPosX;
    }else if (newX < _minPosX){
        newX = _minPosX;
    }
    
    self.frame = CGRectMake(newX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    if ([_delegate respondsToSelector:@selector(switchButtonMoving)]){
        [_delegate switchButtonMoving];
    }
}

@end
