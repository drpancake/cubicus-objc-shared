//
//  CBCanvasCoverView.m
//  Cubicus
//
//  Created by James Potter on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBCanvasCoverView.h"

@implementation CBCanvasCoverView

@synthesize canvasViewController;

- (id)initWithCanvas:(JPCanvasViewController *)controller frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        canvasViewController = controller;
        _points = [[NSMutableArray alloc] init];
        _trackTouches = NO;
        
        // Canvas's view is a subview of this view
        [self addSubview:self.canvasViewController.view];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // Normally the subview would intercept touches at this point,
    // but instead we're forcing this view to intercept them so its
    // UIResponder methods (touchesBegan et al.) are called
    return self;
}

- (void)bufferTouchPoint:(UITouch *)touch
{
    CGPoint point = [touch locationInView:self];
    [_points addObject:[NSNumber numberWithFloat:point.x]];
    [_points addObject:[NSNumber numberWithFloat:point.y]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    NSUInteger fingers = [[event allTouches] count];
    if (fingers == 1) {
        // Only start tracking this path if its not multitouch
        _trackTouches = YES;
        [self bufferTouchPoint:[touches anyObject]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (_trackTouches) {
        [self bufferTouchPoint:[touches anyObject]];
        
        if ([_points count] == 6) {
            // Draw points so far and remove them (except for the final point
            // in the array which anchors the next draw)
            [self.canvasViewController drawPoints:_points notifyDelegate:YES];
            NSUInteger n = [_points count];
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, n - 2)];
            [_points removeObjectsAtIndexes:indexSet];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_trackTouches) {
        // Draw any leftover points
        if ([_points count] > 0) {
            [self.canvasViewController drawPoints:_points notifyDelegate:YES];
            [_points removeAllObjects];
        }
    }
    
    _trackTouches = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Same behaviour as if touches ended normally
    [self touchesEnded:touches withEvent:event];
}

@end
