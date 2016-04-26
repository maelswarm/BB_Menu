//
//  ViewController.m
//  BB_Menu
//
//  Created by fairy-slipper on 4/25/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import "ViewController.h"
#import "BB_Menu.h"
#import "BB_SliderV.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    BB_SliderV *slider = [[BB_SliderV alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 300.0f) andName:@"Slider1" andSize:6];
    slider.delegate = self;
    [self.view addSubview:slider];
    
    BB_Menu *menu = [[BB_Menu alloc]initWithFrame:CGRectMake(0.0f, screenRect.size.height-200.0f, screenRect.size.width, 200.0f)];
    menu.delegate = self;
    [self.view addSubview:menu];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonPressed:(NSString *)name {
    NSLog(@"Pressed: %@", name);
}

- (void)sliderReleased:(NSString *)name {
    NSLog(@"Released: %@", name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
