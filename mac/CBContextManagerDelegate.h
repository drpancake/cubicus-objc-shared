//
//  CBContextManagerDelegate.h
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBContextManager;
@class CBEvent;

@protocol CBContextManagerDelegate <NSObject>

- (void)manager:(CBContextManager *)manager didReceiveEvent:(CBEvent *)event;

@end