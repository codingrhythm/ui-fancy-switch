//
//  UIFancySwitchButton.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIFancySwitchButton.h"
#define SPAN 4.0f

@implementation UIFancySwitchButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //[self setImage:[UIImage imageNamed:@"slider-btn"]];
        [self setBackgroundColor:[UIColor clearColor]];
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
    
    if ([_delegate respondsToSelector:@selector(switchButtonMoved)]){
        [_delegate switchButtonMoved];
    }
}

- (void) drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat barWidth = rect.size.width * 0.57 - SPAN * 2;
    CGFloat barHeight = rect.size.height * 0.07;
    CGFloat barX = (rect.size.width - barWidth) / 2;
    CGFloat barMargin = barHeight - 3 > 3 ? barHeight - 3 : 3;
    barMargin += barHeight;
    CGFloat secondBarY = (rect.size.height - barHeight) / 2;

    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    UIColor* strokeColor3 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.4];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.1];
    UIColor* color3 = [UIColor colorWithRed: 0.91 green: 0.91 blue: 0.91 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow3 = strokeColor2;
    CGSize shadow3Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow3BlurRadius = 3;
    UIColor* shadow4 = shadowColor4;
    CGSize shadow4Offset = CGSizeMake(0.1, -3.1);
    CGFloat shadow4BlurRadius = 0;
    
    //// Group
    {
        //// Oval Drawing
        
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(SPAN, SPAN, rect.size.width - SPAN*2, rect.size.height - SPAN*2)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, shadow3.CGColor);
        [strokeColor3 setFill];
        [ovalPath fill];
        
        ////// Oval Inner Shadow
        CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadow4BlurRadius, -shadow4BlurRadius);
        ovalBorderRect = CGRectOffset(ovalBorderRect, -shadow4Offset.width, -shadow4Offset.height);
        ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
        
        UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
        [ovalNegativePath appendPath: ovalPath];
        ovalNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadow4Offset.width + round(ovalBorderRect.size.width);
            CGFloat yOffset = shadow4Offset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadow4BlurRadius,
                                        shadow4.CGColor);
            
            [ovalPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
            [ovalNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [ovalNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        [strokeColor setStroke];
        ovalPath.lineWidth = 1;
        [ovalPath stroke];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(barX, secondBarY - barMargin, barWidth, barHeight) cornerRadius: barHeight / 2];
        [color3 setFill];
        [roundedRectangle3Path fill];
        [strokeColor setStroke];
        roundedRectangle3Path.lineWidth = 1;
        [roundedRectangle3Path stroke];
        
        
        //// Rounded Rectangle 4 Drawing
        UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(barX, secondBarY, barWidth, barHeight) cornerRadius: barHeight / 2];
        [color3 setFill];
        [roundedRectangle4Path fill];
        [strokeColor setStroke];
        roundedRectangle4Path.lineWidth = 1;
        [roundedRectangle4Path stroke];
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(barX, secondBarY + barMargin, barWidth, barHeight) cornerRadius: barHeight / 2];
        [color3 setFill];
        [roundedRectangle5Path fill];
        [strokeColor setStroke];
        roundedRectangle5Path.lineWidth = 1;
        [roundedRectangle5Path stroke];
    }
    
    

}

@end
