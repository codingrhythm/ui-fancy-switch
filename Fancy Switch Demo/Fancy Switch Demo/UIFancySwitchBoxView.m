//
//  UIFancySwitchBoxView.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 6/3/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIFancySwitchBoxView.h"

@implementation UIFancySwitchBoxView

#define KAPPA 0.55228571f
#define SPAN 4.0f

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)bgColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        _bgColor = bgColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // General Declarations

    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    UIColor* fillColor = _bgColor;
    
    //// Bezier Drawing
    CGFloat radius = (rect.size.height - SPAN * 2) / 2;
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(rect.size.width - SPAN - radius, SPAN)];
    [bezierPath addLineToPoint: CGPointMake(SPAN + radius, SPAN)];
    [bezierPath addCurveToPoint: CGPointMake(SPAN, rect.size.height/2) controlPoint1: CGPointMake(SPAN + radius * (1 - KAPPA), SPAN) controlPoint2: CGPointMake(SPAN, SPAN + radius * (1 - KAPPA))];
    [bezierPath addCurveToPoint: CGPointMake(SPAN + radius, rect.size.height - SPAN) controlPoint1: CGPointMake(SPAN, rect.size.height - SPAN - radius * (1 - KAPPA)) controlPoint2: CGPointMake(SPAN + radius * (1 - KAPPA), rect.size.height - SPAN)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width - SPAN - radius, rect.size.height - SPAN)];
    [bezierPath addCurveToPoint: CGPointMake(rect.size.width - SPAN, rect.size.height/2) controlPoint1: CGPointMake(rect.size.width - SPAN - radius * (1 - KAPPA), rect.size.height -SPAN) controlPoint2: CGPointMake(rect.size.width - SPAN, rect.size.height - SPAN - radius * (1 - KAPPA))];
    [bezierPath addCurveToPoint: CGPointMake(rect.size.width - SPAN - radius, SPAN) controlPoint1: CGPointMake(rect.size.width - SPAN, SPAN + radius * (1 - KAPPA)) controlPoint2: CGPointMake(rect.size.width - SPAN - radius * (1 - KAPPA), SPAN)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(rect.size.width, rect.size.height)];
    [bezierPath addLineToPoint: CGPointMake(0, rect.size.height)];
    [bezierPath addLineToPoint: CGPointMake(0, 0)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width, 0)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width, rect.size.height)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];
    [strokeColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.06];
    UIColor* shadowColor3 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 0;
    UIColor* shadow2 = shadowColor3;
    CGSize shadow2Offset = CGSizeMake(0.1, -0.1);
    CGFloat shadow2BlurRadius = 10;
    
    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(SPAN, SPAN, rect.size.width - 2 * SPAN, rect.size.height - 2 * SPAN);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect cornerRadius: rect.size.height/2.0f];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [strokeColor setFill];
    [roundedRectanglePath fill];
    
    ////// Rounded Rectangle Inner Shadow
    CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -shadow2BlurRadius, -shadow2BlurRadius);
    roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -shadow2Offset.width, -shadow2Offset.height);
    roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1, -1);
    
    UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
    [roundedRectangleNegativePath appendPath: roundedRectanglePath];
    roundedRectangleNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadow2Offset.width + round(roundedRectangleBorderRect.size.width);
        CGFloat yOffset = shadow2Offset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadow2BlurRadius,
                                    shadow2.CGColor);
        
        [roundedRectanglePath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0);
        [roundedRectangleNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [roundedRectangleNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    [strokeColor setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    [strokeColor setFill];
}

@end
