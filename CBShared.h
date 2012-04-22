//
//  CBShared.h
//  Cubicus
//
//  Created by James Potter on 04/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Common

#import "CBAbstractClient.h"
#import "CBDeviceClient.h"
#import "CBDeviceClientDelegate.h"

// Layout

#import "CBBox.h"
#import "CBButton.h"
#import "CBCanvas.h"
#import "CBHorizontalBox.h"
#import "CBLayout.h"
#import "CBLayoutElement.h"

// Models

#import "CBApplication.h"
#import "CBContext.h"
#import "CBContextState.h"
#import "CBHost.h"
#import "CBEvent.h"
#import "CBEventReceiver.h"

// OS X

#if (TARGET_OS_MAC && !TARGET_OS_IPHONE)

#import "CBAppClient.h"
#import "CBContextManager.h"
#import "CBContextManagerDelegate.h"
#import "CBContextWrapView.h"

// iOS

#elif TARGET_OS_IPHONE

#import "CBElementViewController.h"
#import "CBBoxViewController.h"
#import "CBCanvasViewController.h"
#import "CBCanvasCoverView.h"
#import "CBButtonViewController.h"
#import "CBLayoutElement+VC.h"

#endif