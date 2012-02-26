//
//  CBContextManager.m
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBContextManager.h"

@implementation CBContextManager

@synthesize delegate;
@synthesize context;

- (id)initWithContext:(CBContext *)theContext
{
    self = [super init];
    if (self) {
        context = theContext;
    }
    return self;
}

- (void)wrapView:(NSView *)view
{
    NSLog(@"Wrap view: %@", view);
}

@end
