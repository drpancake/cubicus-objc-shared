//
//  CBAcceleratorView.m
//  Cubicus
//
//  Created by James Potter on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAcceleratorView.h"

@implementation CBAcceleratorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _x = 0;
        _y = 0;
    }
    return self;
}

- (void)setAccelerationX:(double)x y:(double)y
{
    _x = x;
    _y = y;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat w = rect.size.width / 2;
    CGFloat h = rect.size.height / 2;
    
    CGFloat leftMargin = (w / 2);
    leftMargin += leftMargin * _y;
    
    CGFloat topMargin = (h / 2);
    topMargin += topMargin * _x;
    
    CGFloat x = rect.origin.x + leftMargin;
    CGFloat y = rect.origin.y + topMargin;
    
    CGContextAddEllipseInRect(context, CGRectMake(x, y, w, h));
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor);
    CGContextFillPath(context);
    CGContextStrokePath(context);
}

@end
