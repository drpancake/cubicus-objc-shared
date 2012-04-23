//
//  CBAcceleratorViewController.m
//  Cubicus
//
//  Created by James Potter on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAcceleratorViewController.h"

@implementation CBAcceleratorViewController

@synthesize accelerator;
@synthesize acceleratorView;

- (id)initWithAccelerator:(CBAccelerator *)theAccelerator
{
    self = [super initWithElement:theAccelerator];
    if (self) {
        accelerator = theAccelerator;
    }
    return self;
    
}

- (void)loadView
{
    acceleratorView = [[CBAcceleratorView alloc] initWithFrame:CGRectZero];
    self.acceleratorView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view = acceleratorView;
    
    // Listen for accelerometer updates
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = 0.1;
    accelerometer.delegate = self;
}

#pragma mark -
#pragma mark UIAccelerometerDelegate

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    NSDictionary *content = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithDouble:acceleration.x], @"x",
                             [NSNumber numberWithDouble:acceleration.y], @"y",
                             [NSNumber numberWithDouble:acceleration.z], @"z", nil];
    CBEvent *event = [[CBEvent alloc] initWithID:self.accelerator.elementID content:content];
    [self fireEvent:event];
}

@end