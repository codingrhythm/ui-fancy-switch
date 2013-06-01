//
//  UIFancySwitch.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIFancySwitch.h"
#import "UIColor+HexString.h"

#define ROUND_WIDTH 20.0f

@implementation UIFancySwitch{
    UIView *sliderBG;
    UIView *tintColorBG;
    UIImageView *leftBG;
    UIView *middleBG;
    UIImageView *rightBG;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setClipsToBounds:YES];
        
        // set background default tint color 1
        [self setBackgroundColor:[UIColor colorWithHexString:@"#f18fcf"]];
        
        // set the tint color
        CGFloat sectionWidth = self.frame.size.width - ROUND_WIDTH;
        sliderBG = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, sectionWidth * 2, self.frame.size.height)];
        [self addSubview:sliderBG];
        tintColorBG = [[UIView alloc] initWithFrame:CGRectMake(sectionWidth, 0.0f, sectionWidth, self.frame.size.height)];
        [tintColorBG setBackgroundColor:[UIColor colorWithHexString:@"#87c1f5"]];
        [sliderBG addSubview:tintColorBG];
        
        // add bg
        leftBG = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 20.0f, self.frame.size.height)];
        [leftBG setImage:[UIImage imageNamed:@"bg-left"]];
        [self addSubview:leftBG];
        
        middleBG = [[UIView alloc] initWithFrame:CGRectMake(20.0f, 0.0f, self.frame.size.width - 20.0f * 2, self.frame.size.height)];
        [middleBG setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-middle"]]];
        [self addSubview:middleBG];
        
        rightBG = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 20.0f, 0.0f, 20.0f, self.frame.size.height)];
        [rightBG setImage:[UIImage imageNamed:@"bg-right"]];
        [self addSubview:rightBG];
        
        // add switch button
        _switchButton = [[UIFancySwitchButton alloc] initWithFrame:CGRectMake(0.0f, 3.0f, 44.0f, 44.0f)];
        
    }
    return self;
}

- (void)setTintColor1:(UIColor *)tintColor1
{
    _tintColor1 = tintColor1;
    [self setBackgroundColor:_tintColor1];
}

- (void)setTintColor2:(UIColor *)tintColor2
{
    _tintColor2 = tintColor2;
    [tintColorBG setBackgroundColor:_tintColor2];
}

@end
