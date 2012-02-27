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
@synthesize active;

- (id)initWithFrame:(CGRect)frame clickBlock:(BasicBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        clickBlock = block;
        active = NO;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    if (active) {
        [[NSColor blueColor] setFill];
    } else {
        [[NSColor grayColor] setFill];
    }
    NSRectFill(dirtyRect);
}

- (void)setActive:(bool)theActive
{
    active = theActive;
    [self setNeedsDisplay:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    self.clickBlock();
}

@end
