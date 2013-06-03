//
//  UIFancySwitch.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIFancySwitch.h"
#import "UIColor+HexString.h"
#import "UIFancySwitchBoxView.h"


@implementation UIFancySwitch{
    UIView *sliderBG;
    UIView *tintColorBG;
    UIImageView *leftBG;
    UIView *middleBG;
    UIImageView *rightBG;
    UIFancySwitchBoxView *boxBG;
    CGFloat switchButtonSize;
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
        CGFloat sectionWidth = self.frame.size.width - self.frame.size.height / 2;
        sliderBG = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, sectionWidth * 2, self.frame.size.height)];
        [self addSubview:sliderBG];
        tintColorBG = [[UIView alloc] initWithFrame:CGRectMake(sectionWidth, 0.0f, sectionWidth, self.frame.size.height)];
        [tintColorBG setBackgroundColor:[UIColor colorWithHexString:@"#87c1f5"]];
        [sliderBG addSubview:tintColorBG];
        
        // add bg
        boxBG = [[UIFancySwitchBoxView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height) withBackgroundColor:[UIColor colorWithHexString:@"#f5f5f5"]];
        [self addSubview:boxBG];
        
        // add switch button
        switchButtonSize = frame.size.height;
        _switchButton = [[UIFancySwitchButton alloc] initWithFrame:CGRectMake(frame.size.width - switchButtonSize, 0.0f, switchButtonSize, switchButtonSize)];
        _switchButton.delegate = self;
        _switchButton.maxPosX = frame.size.width - switchButtonSize;
        _switchButton.minPosX = 0.0f;
        [self addSubview:_switchButton];
        
        // add icons
        CGFloat iconSpan = (self.frame.size.height - 22.0f) / 2;
        _iconOff = [[UIImageView alloc] initWithFrame:CGRectMake(iconSpan, iconSpan, 22.0f, 22.0f)];
        [sliderBG addSubview:_iconOff];
        
        _iconOn = [[UIImageView alloc] initWithFrame:CGRectMake(sliderBG.frame.size.width - iconSpan - 22.0f, iconSpan, 22.0f, 22.0f)];
        [sliderBG addSubview:_iconOn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(tapped)];
        [self addGestureRecognizer:tap];
        
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

- (void) switchButtonMoved
{
    CGFloat btnX = _switchButton.frame.origin.x;
    [sliderBG setFrame:CGRectMake(btnX - (self.frame.size.width - _switchButton.frame.size.height), sliderBG.frame.origin.y, sliderBG.frame.size.width, sliderBG.frame.size.height)];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGFloat btnX = _switchButton.frame.origin.x;
    
    if (btnX > (self.frame.size.width - switchButtonSize) / 2){
        [self setOn:NO];
    }else{
        [self setOn:YES];
    }
}

- (void) setOn:(BOOL)on
{
    _on = on;
    
    [self updateSwitch];
}

- (void)updateSwitch
{
    if (!_on){
        // female
        [UIView beginAnimations:@"moving switch to right" context:nil];
        sliderBG.frame = CGRectMake(0.0f, sliderBG.frame.origin.y, sliderBG.frame.size.width, sliderBG.frame.size.height);
        [_switchButton setFrame:CGRectMake(self.frame.size.width - switchButtonSize, 0.0f, switchButtonSize, switchButtonSize)];
        [UIView commitAnimations];
        
    }else{
        // male
        [UIView beginAnimations:@"moving switch to left" context:nil];
        sliderBG.frame = CGRectMake(0 - (self.frame.size.width - switchButtonSize), sliderBG.frame.origin.y, sliderBG.frame.size.width, sliderBG.frame.size.height);
        [_switchButton setFrame:CGRectMake(0.0f, 0.0f, switchButtonSize, switchButtonSize)];
        [UIView commitAnimations];
        
    }
    
}

- (void) tapped
{
    if (!_on){
        [self setOn:YES];
    }else{
        [self setOn:NO];
    }
}

@end
