//
//  BB_SliderV.h
//  BB_Menu
//
//  Created by fairy-slipper on 4/26/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sliderdelegate <NSObject>
@required
- (void)sliderReleased:(NSString *)name;
@end

@interface BB_SliderV : UIView

@property (weak) id <sliderdelegate> delegate;
@property float size;
@property float value;
@property (copy) NSString *name;
@property (strong, nonatomic) NSMutableArray *imageViewArray;

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name andSize:(float)size;

@end
