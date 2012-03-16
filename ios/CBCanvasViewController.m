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
    self = [super init];
    if (self) {
        canvas = theCanvas;
    }
    return self;
}

- (void)loadView
{
    _canvasViewController = [[JPCanvasViewController alloc] init];
    _canvasViewController.delegate = self;
    self.view = _canvasViewController.view;
}

#pragma mark -
#pragma mark JPCanvasViewControllerDelegate

- (void)canvas:(JPCanvasViewController *)canvas didDrawPoints:(NSArray *)points
{
    // Wrap in an event and fire it
    NSDictionary *content = [NSDictionary dictionaryWithObjectsAndKeys: points, @"points", nil];
    CBEvent *event = [[CBEvent alloc] initWithID:self.canvas.elementID content:content];
    [self sendEvent:event];
}

@end
