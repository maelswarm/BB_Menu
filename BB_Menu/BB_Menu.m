//
//  BB_Menu.m
//  BB_Menu
//
//  Created by fairy-slipper on 4/25/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BB_Menu.h"
#import "BB_Button.h"

@interface BB_Menu()

@property CGRect screenRect;

@property (strong, nonatomic) UIImageView *button1ImageView;
@property (strong, nonatomic) UIImageView *button2ImageView;
@property (strong, nonatomic) UIImageView *button3ImageView;
@property (strong, nonatomic) UIImageView *button4ImageView;
@property (strong, nonatomic) UIImageView *button5ImageView;

@property (strong, nonatomic) BB_Button *exButton1;
@property (strong, nonatomic) BB_Button *exButton2;
@property (strong, nonatomic) BB_Button *exButton3;
@property (strong, nonatomic) BB_Button *exButton4;
@property (strong, nonatomic) BB_Button *exButton5;

@property BOOL button3open;

@end

@implementation BB_Menu : UIView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.screenRect = [[UIScreen mainScreen] bounds];
        
        self.userInteractionEnabled = YES;
        self.frame = frame;
        self.button3open=false;
        
        
        self.exButton1 = [[BB_Button alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20) andName:@"exButton1"];
        self.exButton1.delegate = self;
        self.exButton1.backgroundColor = [UIColor blackColor];
        [self addSubview:self.exButton1];
        
        self.exButton2 = [[BB_Button alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20) andName:@"exButton2"];
        self.exButton2.delegate = self;
        self.exButton2.backgroundColor = [UIColor blackColor];
        [self addSubview:self.exButton2];
        
        self.exButton3 = [[BB_Button alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20) andName:@"exButton3"];
        self.exButton3.delegate = self;
        self.exButton3.backgroundColor = [UIColor blackColor];
        [self addSubview:self.exButton3];
        
        self.exButton4 = [[BB_Button alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20) andName:@"exButton4"];
        self.exButton4.delegate = self;
        self.exButton4.backgroundColor = [UIColor blackColor];
        [self addSubview:self.exButton4];
        
        self.exButton5 = [[BB_Button alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20) andName:@"exButton5"];
        self.exButton5.delegate = self;
        self.exButton5.backgroundColor = [UIColor blackColor];
        [self addSubview:self.exButton5];
        
        
        self.button1ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 150.0f, self.screenRect.size.width*.2f, 50.0f)];
        [self addSubview:self.button1ImageView];
        self.button2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.2f, 150.0f, self.screenRect.size.width*.2f, 50.0f)];
        [self addSubview:self.button2ImageView];
        self.button3ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.4f, self.frame.size.height-self.screenRect.size.width*.2f, self.screenRect.size.width*.2f, self.screenRect.size.width*.2f)];
        [self addSubview:self.button3ImageView];
        self.button4ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.6f, 150.0f, self.screenRect.size.width*.2f, 50.0f)];
        [self addSubview:self.button4ImageView];
        self.button5ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.screenRect.size.width*.8f, 150.0f, self.screenRect.size.width*.2f, 50.0f)];
        [self addSubview:self.button5ImageView];
        
        self.button1ImageView.backgroundColor = [UIColor purpleColor];
        self.button2ImageView.backgroundColor = [UIColor redColor];
        self.button3ImageView.backgroundColor = [UIColor greenColor];
        self.button4ImageView.backgroundColor = [UIColor blueColor];
        self.button5ImageView.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    //NSLog(@"Touch began: %f %f", location.x, location.y);
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    //NSLog(@"Touch moved: %f %f", location.x, location.y);
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInView:self];
    
    if (location.x<self.screenRect.size.width*.2f) {
        [self.delegate buttonPressed:@"Button 1"];
    } else if (location.x>self.screenRect.size.width*.2f && location.x<self.screenRect.size.width*.4f) {
        [self.delegate buttonPressed:@"Button 2"];
    } else if (location.x>self.screenRect.size.width*.4f && location.x<self.screenRect.size.width*.6f) {
        [self.delegate buttonPressed:@"Button 3"];
        if (!self.button3open) {
            [UIView animateWithDuration:.5f delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
                self.exButton1.frame = CGRectMake(self.screenRect.size.width*.25f-(35.0f/2.0f), 70.0f, 35.0f, 35.0f);
                self.exButton2.frame = CGRectMake(self.screenRect.size.width*.325f-(35.0f/2.0f), 20.0f, 35.0f, 35.0f);
                self.exButton3.frame = CGRectMake(self.screenRect.size.width*.5f-(35.0f/2.0f), 0.0f, 35.0f, 35.0f);
                self.exButton4.frame = CGRectMake(self.screenRect.size.width*.675f-(35.0f/2.0f), 20.0f, 35.0f, 35.0f);
                self.exButton5.frame = CGRectMake(self.screenRect.size.width*.75f-(35.0f/2.0f), 70.0f, 35.0f, 35.0f);
            } completion:^(BOOL finished){
                self.button3open=true;
                self.exButton1.userInteractionEnabled = true;
                self.exButton2.userInteractionEnabled = true;
                self.exButton3.userInteractionEnabled = true;
                self.exButton4.userInteractionEnabled = true;
                self.exButton5.userInteractionEnabled = true;
            }];
        } else {
            [UIView animateWithDuration:.5f delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
                self.exButton1.frame = CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20);
                self.exButton2.frame = CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20);
                self.exButton3.frame = CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20);
                self.exButton4.frame = CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20);
                self.exButton5.frame = CGRectMake(self.screenRect.size.width*.5f-10.0f, 150.0f, 20, 20);
            } completion:^(BOOL finished){
                self.button3open=false;
                self.exButton1.userInteractionEnabled = false;
                self.exButton2.userInteractionEnabled = false;
                self.exButton3.userInteractionEnabled = false;
                self.exButton4.userInteractionEnabled = false;
                self.exButton5.userInteractionEnabled = false;
            }];
        }
        
    } else if (location.x>self.screenRect.size.width*.6f && location.x<self.screenRect.size.width*.8f) {
        [self.delegate buttonPressed:@"Button 4"];
    } else if (location.x>self.screenRect.size.width*.8f && location.x<self.screenRect.size.width) {
        [self.delegate buttonPressed:@"Button 5"];
    }
}

- (void)buttonPressed:(NSString *)name {
    [self.delegate buttonPressed:name];
}

@end
