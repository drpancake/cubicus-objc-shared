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
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat w = rect.size.width / 2;
    CGFloat h = rect.size.height / 2;
    CGFloat x = rect.origin.x + (w / 2);
    CGFloat y = rect.origin.y + (h / 2);
    
    CGContextAddEllipseInRect(context, CGRectMake(x, y, w, h));
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3].CGColor);
    CGContextFillPath(context);
    CGContextStrokePath(context);
}

@end
