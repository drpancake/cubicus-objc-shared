//
//  CBClientDelegate.h
//  Cubicus
//
//  Created by James Potter on 11/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBApplication.h"

@class CBClient;

@protocol CBClientDelegate <NSObject>

- (void)client:(CBClient *)client didReceiveApplications:(NSArray *)applications;
- (void)client:(CBClient *)client didSwitchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID;

@optional // for now

- (void)client:(CBClient *)client applicationAdded:(CBApplication *)application;
- (void)client:(CBClient *)client applicationRemoved:(CBApplication *)application;

@end
