//
//  BB_Button.h
//  BB_Menu
//
//  Created by fairy-slipper on 4/25/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol buttondelegate <NSObject>
@required
- (void)buttonPressed:(NSString *)name;
@end

@interface BB_Button : UIView {
    
}

@property (weak) id <buttondelegate> delegate;
@property (copy) NSString *name;
@property (strong, nonatomic) UIImageView *imageView;

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name;

@end
