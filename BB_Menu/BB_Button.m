//
//  BB_Button.m
//  BB_Menu
//
//  Created by fairy-slipper on 4/25/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import "BB_Button.h"

@interface BB_Button ()

@end

@implementation BB_Button

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name {
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = false;
        self.frame = frame;
        self.name = name;
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
//    NSLog(@"Touch began: %f %f", location.x, location.y);
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    //NSLog(@"Touch moved: %f %f", location.x, location.y);
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    [self.delegate buttonPressed:self.name];
}
    
@end
