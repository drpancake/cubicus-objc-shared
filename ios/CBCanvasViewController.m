//
//  CBCanvasViewController.m
//  CubicusClient
//
//  Created by James Potter on 08/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBCanvasViewController.h"

@implementation CBCanvasViewController

@synthesize canvas;

- (id)initWithCanvas:(CBCanvas *)theCanvas
{
    self = [super initWithElement:theCanvas];
    if (self) {
        canvas = theCanvas;
    }
    return self;
}

- (void)loadView
{
    _canvasViewController = [[JPCanvasViewController alloc] init];
    _canvasViewController.delegate = self;
    
    // Cover view adds canvas view as its subclass in order to filter
    // out multitouch events (so that double finger swipe between contexts
    // can work)
    CBCanvasCoverView *coverView = [[CBCanvasCoverView alloc]
                                    initWithCanvas:_canvasViewController
                                    frame:CGRectZero];
    self.view = coverView;
}

#pragma mark -
#pragma mark JPCanvasViewControllerDelegate

- (void)canvas:(JPCanvasViewController *)canvas didDrawPoints:(NSArray *)points
{
    // Wrap in an event and fire it
    NSDictionary *content = [NSDictionary dictionaryWithObjectsAndKeys: points, @"points", nil];
    CBEvent *event = [[CBEvent alloc] initWithID:self.canvas.elementID content:content];
    [self fireEvent:event];
}

- (void)canvasDidFinishLoad:(JPCanvasViewController *)theCanvas
{    
    // Plot any initial persisted points sent by the daemon
    [theCanvas drawPoints:self.canvas.points];
    
    // Set initial color if we have one
    if (self.canvas.color)
        _canvasViewController.strokeColor = self.canvas.color;
}

#pragma mark -
#pragma mark CBEventReceiver

- (void)sender:(id)sender didFireEvent:(CBEvent *)event
{
    if ([event.content objectForKey:@"points"]) {
        NSArray *points = (NSArray *)[event.content objectForKey:@"points"];
        [_canvasViewController drawPoints:points];
    } else if ([event.content objectForKey:@"color"]) {
        NSString *color = [event.content objectForKey:@"color"];
        _canvasViewController.strokeColor = color;
    }
}

@end
