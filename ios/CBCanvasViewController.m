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
    self.view = _canvasViewController.view;
}

@end
