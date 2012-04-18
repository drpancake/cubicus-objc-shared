//
//  CBContextManager.h
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBContext.h"
#import "CBContextManagerDelegate.h"
#import "CBContextWrapView.h"
#import "CBEventReceiver.h"

@class CBAppClient;

@interface CBContextManager : NSObject <CBEventReceiver>

- (id)initWithContext:(CBContext *)context client:(CBAppClient *)client;
- (void)wrapView:(NSView *)view;

@property (nonatomic, strong, readonly) CBContext *context;
@property (nonatomic, weak, readonly) CBAppClient *client;
@property (nonatomic, strong, readonly) CBContextWrapView *wrapView;

// Must be assign rather than weak for now (until NSWindowController/NSViewController support it)
@property (nonatomic, assign) id<CBContextManagerDelegate> delegate;

@end
