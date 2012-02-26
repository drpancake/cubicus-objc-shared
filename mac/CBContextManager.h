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

@interface CBContextManager : NSObject

- (id)initWithContext:(CBContext *)context;
- (void)wrapView:(NSView *)view;

@property (nonatomic, strong, readonly) CBContext *context;
@property (nonatomic, weak) id<CBContextManagerDelegate> delegate;

@end
