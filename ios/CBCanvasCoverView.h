//
//  CBCanvasCoverView.h
//  Cubicus
//
//  Created by James Potter on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPCanvasViewController.h"

@interface CBCanvasCoverView : UIView {
@private
    NSMutableArray *_points;
    BOOL _trackTouches;
}

- (id)initWithCanvas:(JPCanvasViewController *)canvasViewController frame:(CGRect)frame;

// Given UITouch's CGPoint in this view is added to _points
- (void)bufferTouchPoint:(UITouch *)touch;

@property (nonatomic, weak, readonly) JPCanvasViewController *canvasViewController;

@end
