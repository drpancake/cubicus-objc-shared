//
//  CBContextWrapView.m
//  CubicusDraw
//
//  Created by James Potter on 27/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBContextWrapView.h"

@implementation CBContextWrapView

@synthesize clickBlock;

- (id)initWithFrame:(CGRect)frame clickBlock:(BasicBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        clickBlock = block;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
}

- (void)mouseDown:(NSEvent *)theEvent
{
    self.clickBlock();
}

@end
