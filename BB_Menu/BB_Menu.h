//
//  BB_Menu.h
//  BB_Menu
//
//  Created by fairy-slipper on 4/25/16.
//  Copyright © 2016 fairy-slipper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BB_Button.h"

@protocol menudelegate <NSObject>
@required
- (void)buttonPressed:(NSString *)name;
@end

@interface BB_Menu : UIView <buttondelegate> {
    
}
@property (weak) id <menudelegate> delegate;

@end
