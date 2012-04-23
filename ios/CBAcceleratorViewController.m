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
}

@end