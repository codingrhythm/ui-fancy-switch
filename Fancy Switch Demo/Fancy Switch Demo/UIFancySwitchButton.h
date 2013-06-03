//
//  UIFancySwitchButton.h
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

// Delegate methods
@protocol UIFancySwitchButtonDelegate <NSObject>

@optional
// when switch button is dragged by user
-(void)switchButtonMoved;

@end

@interface UIFancySwitchButton : UIView

// most left position the button can move
@property (nonatomic) CGFloat minPosX;

// most right position the button can move
@property (nonatomic) CGFloat maxPosX;

@property (nonatomic, strong) id <UIFancySwitchButtonDelegate> delegate;

@end
