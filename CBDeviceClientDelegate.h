//
//  CBDeviceClientDelegate.h
//  Cubicus
//
//  Created by James Potter on 11/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBApplication.h"

@class CBDeviceClient;

@protocol CBDeviceClientDelegate <NSObject>

- (void)client:(CBDeviceClient *)client didReceiveApplications:(NSArray *)applications;
- (void)client:(CBDeviceClient *)client didSwitchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID;

@optional // for now

- (void)client:(CBDeviceClient *)client applicationAdded:(CBApplication *)application;
- (void)client:(CBDeviceClient *)client applicationRemoved:(CBApplication *)application;

@end
