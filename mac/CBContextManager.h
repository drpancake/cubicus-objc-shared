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

@class CBAppClient;

@interface CBContextManager : NSObject

- (id)initWithContext:(CBContext *)context client:(CBAppClient *)client;
- (void)wrapView:(NSView *)view;

@property (nonatomic, strong, readonly) CBContext *context;
@property (nonatomic, weak, readonly) CBAppClient *client;
@property (nonatomic, strong, readonly) CBContextWrapView *wrapView;
@property (nonatomic, weak) id<CBContextManagerDelegate> delegate;

@end
