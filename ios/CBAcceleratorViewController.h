//
//  CBAcceleratorViewController.h
//  Cubicus
//
//  Created by James Potter on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBElementViewController.h"
#import "CBAccelerator.h"
#import "CBAcceleratorView.h"

@interface CBAcceleratorViewController : CBElementViewController <UIAccelerometerDelegate>

- (id)initWithAccelerator:(CBAccelerator *)accelerator;

@property (nonatomic, strong, readonly) CBAccelerator *accelerator;
@property (nonatomic, strong, readonly) CBAcceleratorView *acceleratorView;

@end
