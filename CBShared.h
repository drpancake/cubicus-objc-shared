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

// OS X

#if TARGET_OS_MAC

#import "CBAppClient.h"
#import "CBAppClientDelegate.h"
#import "CBContextManager.h"
#import "CBContextManagerDelegate.h"
#import "CBContextWrapView.h"

// iOS

#elif && TARGET_OS_IPHONE

//#import "CBCanvasViewController.h"

#endif