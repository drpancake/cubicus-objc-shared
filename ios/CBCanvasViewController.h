//
//  CBCanvasViewController.h
//  CubicusClient
//
//  Created by James Potter on 08/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBElementViewController.h"
#import "CBShared.h"
#import "JPCanvasViewController.h"

/*
  Note: this class owns a CBCanvasCoverView which acts as a superview for a
  JPCanvasViewController's view. That way it can intercept touches and only
  let single touch events through (in order not to interfere with swiping between
  CBContextViewController objects higher up in the hierarchy)
*/
@interface CBCanvasViewController : CBElementViewController <JPCanvasViewControllerDelegate> {
@private
    JPCanvasViewController *_canvasViewController;
}

- (id)initWithCanvas:(CBCanvas *)canvas;

@property (nonatomic, strong, readonly) CBCanvas *canvas;

@end