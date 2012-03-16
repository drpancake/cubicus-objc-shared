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

@interface CBCanvasViewController : CBElementViewController <JPCanvasViewControllerDelegate> {
    @private
    JPCanvasViewController *_canvasViewController;
}

- (id)initWithCanvas:(CBCanvas *)canvas;

@property (nonatomic, strong, readonly) CBCanvas *canvas;

@end
