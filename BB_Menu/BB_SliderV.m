//
//  BB_SliderV.m
//  BB_Menu
//
//  Created by fairy-slipper on 4/26/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import "BB_SliderV.h"

@implementation BB_SliderV

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name andSize:(float)size {
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.imageViewArray = [NSMutableArray new];
        self.frame = frame;
        self.name = name;
        self.size = size;
        self.value = 0.0f;
        
        for (int i=0; i<size; i++) {
            UIImageView *tmpView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, i*self.frame.size.height/self.size, self.frame.size.width, self.frame.size.height/self.size)];
            tmpView.contentMode = UIViewContentModeScaleAspectFit;
            tmpView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:i/self.size alpha:1.0f];
            [self addSubview:tmpView];
            [self.imageViewArray addObject:tmpView];
            [UIView animateWithDuration:1.0f animations:^{
                tmpView.backgroundColor = [UIColor clearColor];
            }];
        }
    }
    return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    
    for (int i=0; i<self.size; i++) {
        if (location.y < (self.frame.size.height/self.size)*(i+1) && location.y >= (self.frame.size.height/self.size)*(i)) {
            UIImageView *imageView = (UIImageView *)[self.imageViewArray objectAtIndex:i];
            [UIView animateWithDuration:1.0f animations:^{
                imageView.backgroundColor = [UIColor redColor];
            }];
        }
    }
    //    NSLog(@"Touch began: %f %f", location.x, location.y);
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    //NSLog(@"Touch moved: %f %f", location.x, location.y);
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    for (int i=0; i<self.size; i++) {
        if (location.y < (self.frame.size.height/self.size)*(i+1) && location.y >= (self.frame.size.height/self.size)*(i)) {
            self.value = i;
            [self.delegate sliderReleased:self.name];
            UIImageView *imageView = (UIImageView *)[self.imageViewArray objectAtIndex:i];
            [UIView animateWithDuration:1.0f animations:^{
                imageView.backgroundColor = [UIColor clearColor];
            }];
        }
    }
}

@end
