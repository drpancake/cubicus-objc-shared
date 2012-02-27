//
//  CBContextManager.m
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBContextManager.h"
#import "CBContextWrapView.h"
#import "CBAppClient.h"

@implementation CBContextManager

@synthesize delegate;
@synthesize context;
@synthesize client;

- (id)initWithContext:(CBContext *)theContext client:(CBAppClient *)theClient
{
    self = [super init];
    if (self) {
        context = theContext;
        client = theClient;
    }
    return self;
}

- (void)wrapView:(NSView *)view
{
    CBContextWrapView *wrapView = [[CBContextWrapView alloc] initWithFrame:view.frame clickBlock:^{
        [self.client switchContext:self.context.contextID];
    }];
    
    NSView *parent = view.superview;
    [view removeFromSuperview];
    [parent addSubview:wrapView];
    
}

@end
