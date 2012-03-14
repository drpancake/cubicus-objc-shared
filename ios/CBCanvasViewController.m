//
//  CBCanvasViewController.m
//  CubicusClient
//
//  Created by James Potter on 08/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBCanvasViewController.h"

@implementation CBCanvasViewController

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
    
}

@end
