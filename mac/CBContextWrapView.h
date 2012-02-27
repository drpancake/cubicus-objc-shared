//
//  CBContextWrapView.h
//  CubicusDraw
//
//  Created by James Potter on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void(^BasicBlock)(void);

@interface CBContextWrapView : NSView

- (id)initWithFrame:(CGRect)frame clickBlock:(BasicBlock)block;

@property (nonatomic, copy, readonly) BasicBlock clickBlock;
@property (nonatomic, assign) bool active;

@end
