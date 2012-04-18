//
//  CBContextManager.m
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBContextManager.h"
#import "CBAppClient.h"

@implementation CBContextManager

@synthesize delegate;
@synthesize context;
@synthesize client;
@synthesize wrapView;

- (id)initWithContext:(CBContext *)theContext
{
    self = [super init];
    if (self) {
        context = theContext;
        wrapView = nil;
    }
    return self;
}

- (void)setClient:(CBAppClient *)theClient
{
    client = theClient;
    
    if (client != nil) {
        // Listen for client's context changes
        [client addObserver:self
                      forKeyPath:@"currentContextID"
                         options:NSKeyValueObservingOptionNew
                         context:NULL];
    } else {
        [client removeObserver:self forKeyPath:@"currentContextID"];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"currentContextID"]) {
        // If new context matches our CBContext, set wrap view = active
        NSUInteger contextID = [[change objectForKey:NSKeyValueChangeNewKey] intValue];
        self.wrapView.active = (contextID == self.context.contextID);
    }
}

- (void)dealloc
{
    if (self.client)
        [self.client removeObserver:self forKeyPath:@"currentContextID"];
}

- (void)wrapView:(NSView *)view
{
    wrapView = [[CBContextWrapView alloc] initWithFrame:view.frame clickBlock:^{
        [self.client switchContext:self.context.contextID];
    }];
    
    NSView *parent = view.superview;
    [view removeFromSuperview];
    [parent addSubview:wrapView];
    
}

#pragma mark -
#pragma mark CBEventReceiver

- (void)sender:(id)sender didFireEvent:(CBEvent *)event
{
    // Events are received by CBAppClient, filtered for the correct
    // context and sent here
    
    // Forward to delegate
    [self.delegate manager:self didReceiveEvent:event];
}

@end
