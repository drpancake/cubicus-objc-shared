//
//  CBAcceleratorView.h
//  Cubicus
//
//  Created by James Potter on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBAcceleratorView : UIView {
@private
    // Current acceleration values
    double _x;
    double _y;
}

- (void)setAccelerationX:(double)x y:(double)y;

@end
