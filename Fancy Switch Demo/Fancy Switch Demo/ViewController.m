//
//  ViewController.m
//  Fancy Switch Demo
//
//  Created by Zhu Yuzhou on 5/31/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "ViewController.h"
#import "UIFancySwitch.h"
#import "UIColor+HexString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#f5f5f5"]];
    
    UIFancySwitch *fancySwitch = [[UIFancySwitch alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 120.0f, 50.0f)];
    [self.view addSubview:fancySwitch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
