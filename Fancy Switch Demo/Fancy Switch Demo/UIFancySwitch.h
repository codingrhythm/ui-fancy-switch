//
//  UIFancySwitch.h
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFancySwitchButton.h"

@interface UIFancySwitch : UIControl <UIFancySwitchButtonDelegate>

@property (strong, nonatomic) NSDictionary *skinSettings;
@property (strong, nonatomic) UIFancySwitchButton *switchButton;

// skin settings
@property (strong, nonatomic) UIColor *tintColor1;
@property (strong, nonatomic) UIColor *tintColor2;

@end
